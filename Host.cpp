#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

#include "EventTimer.h"
#include <CL/cl2.hpp>
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <unistd.h>
#include <vector>

#include "Pipeline.h"
#include "Common/Utilities.h"

#define NUM_MAT 4


int main(int argc, char *argv[])
{
    unsigned char *Input = (unsigned char *)malloc(FRAMES * INPUT_FRAME_SIZE);
    unsigned char *Output = (unsigned char *)malloc(FRAMES * MAX_OUTPUT_SIZE);
    unsigned char *DifferentiateOut = (unsigned char *)malloc(FRAMES * OUTPUT_FRAME_SIZE);
    unsigned char *FilterInPtr[NUM_MAT];
    unsigned char *FilterOutPtr[NUM_MAT];
    cl::Buffer FilterInput_buf[NUM_MAT];
    cl::Buffer FilterOutput_buf[NUM_MAT];
    int Size = 0;/*To store total length of compressed output of all frames combined*/
    
    std::vector<cl::Event> read_done(FRAMES);    // host perspective 
    std::vector<cl::Event> write_done(FRAMES);
    std::vector<cl::Event> execute_done(FRAMES); // host perspective 
    std::vector<cl::Event> write_waitlist;
    std::vector<std::vector<cl::Event>> execute_waitlists(FRAMES);
    std::vector<std::vector<cl::Event>> read_waitlists(FRAMES);
    // ------------------------------------------------------------------------------------
    // Step 1: Initialize the OpenCL environment
     // ------------------------------------------------------------------------------------
    timer2.add("OpenCL Initialization");
    cl_int err;
    std::string binaryFile = argv[1];
    unsigned fileBufSize;
    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char *fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err);
    cl::Kernel krnl_Filter(program, "Filter_HW", &err);
     
    // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
    timer2.add("Allocate contiguous OpenCL buffers");

    size_t elements_per_iteration = SCALED_FRAME_SIZE;
    size_t FilterInputbytes_per_iteration = elements_per_iteration * sizeof(unsigned char);
    size_t FilterOutputbytes_per_iteration = OUTPUT_FRAME_SIZE * sizeof(unsigned char);

   
    /*Create NUM_MAT buffers for parallel computing of Filter kernel*/
    for(int i = 0; i < NUM_MAT; i++)
    {
        FilterInput_buf[i] = cl::Buffer(context, CL_MEM_READ_ONLY, FilterInputbytes_per_iteration, NULL, &err);
        FilterOutput_buf[i] = cl::Buffer(context, CL_MEM_READ_ONLY, FilterOutputbytes_per_iteration, NULL, &err);
    }

    /*Assign the pointer of Filter input to output of Scaled array*/
    for(int i = 0; i < NUM_MAT; i++)
    {
        FilterInPtr[i] = (unsigned char*)q.enqueueMapBuffer(FilterInput_buf[i], CL_TRUE, CL_MAP_WRITE, 0, bytes_per_iteration);
        FilterOutPtr[i] = (unsigned char*)q.enqueueMapBuffer(FilterOutput_buf[i], CL_TRUE, CL_MAP_WRITE, 0, bytes_per_iteration);
    }
    
    
    Load_data(Input_data);
    /*Compute scaling for FRAMES*/
    for(int frame = 0; frame < FRAMES; frame++)
    {
        if(frame >= NUM_MAT)
        {
            read_done[frame-(NUM_MAT)].wait();
            Differentiate_SW(FilterOutPtr + (frame - NUM_MAT)%NUM_MAT,DifferentiateOut + frame*OUTPUT_FRAME_SIZE);
            Size = Compress_SW(DifferentiateOut + frame * OUTPUT_FRAME_SIZE, Output + frame * MAX_OUTPUT_SIZE);
           //Load data for Filter kernel
            Scale_SW(Input + frame*INPUT_FRAME_SIZE,FilterInPtr + (frame % NUM_MAT) * SCALED_FRAME_SIZE);
        }
        else
        {
            //Load data for Filter kernel
            Scale_SW(Input + frame * INPUT_FRAME_SIZE,FilterInPtr + frame * SCALED_FRAME_SIZE);
        }
        //Set arguments for Filter
        krne_Filter.setArg(0, FilterInput_buf[frame%NUM_MAT]);
        krnl_Filter.setArg(1, FilterOutput_buf[frame%NUM_MAT]);
        
        if(frame == 0)
        {
            q.enqueueMigrateMemObjects(FilterInput_buf[frame%NUM_MAT], 0 /* 0 means from host*/, NULL, &write_done[frame]);
            write_waitlist.push_back(write_done[frame]);
        }
        else
        {
            q.enqueueMigrateMemObjects(FilterInput_buf[frame%NUM_MAT], 0 /* 0 means from host*/, &write_waitlist, &write_done[frame]);
            write_waitlist.push_back(write_done[frame]);
        }

        execute_waitlists[frame].push_back(write_done[frame]);
        q.enqueueTask(krne_Filter, &execute_waitlists[frame], &execute_done[frame]);

        read_waitlists[frame].push_back(execute_done[frame]);
        q.enqueueMigrateMemObjects({FilterOutput_buf[frame%NUM_MAT]}, CL_MIGRATE_MEM_OBJECT_HOST, &read_waitlists[frame], &read_done[frame]);

    }
    q.finish();
    /*Compute Differentiate and Compress for the last NUM_MAT frames once everything in queue finishes*/
    for(int frame = FRAMES - NUM_MAT - 1; frame < FRAMES; frame++)
    {
       Differentiate_SW(FilterOutPtr + frame * OUTPUT_FRAME_SIZE, DifferentiateOut + frame * OUTPUT_FRAME_SIZE);
       Size = Compress(DifferentiateOut + frame * OUTPUT_FRAME_SIZE, Output + frame * MAX_OUTPUT_SIZE); 
    }
    Store_data("Output_new.bin", Output_data, Size);
    Check_data(Output_data, Size);
    /*free memory*/
    free(Input);
    free(Output);
    free(DifferentiateOut);

}

