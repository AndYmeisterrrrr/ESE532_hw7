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
#include "Utilities.h"

#define NUM_MAT 1


int main(int argc, char *argv[])
{
    unsigned char *Input = (unsigned char *)malloc(FRAMES * INPUT_FRAME_SIZE);
    //unsigned char *Output = (unsigned char *)malloc(FRAMES * MAX_OUTPUT_SIZE);
    // unsigned char *DifferentiateOut = (unsigned char *)malloc(FRAMES * OUTPUT_FRAME_SIZE);
  
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
    // timer2.add("OpenCL Initialization");
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
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::Kernel krnl_Filter(program, "Filter_HW", &err);
     
    // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
    // timer2.add("Allocate contiguous OpenCL buffers");

    size_t FilterInputbytes_per_iteration = SCALED_FRAME_SIZE * sizeof(unsigned char);
    size_t FilterOutputbytes_per_iteration = OUTPUT_FRAME_SIZE * sizeof(unsigned char);

     printf("before making buffer\n");
    /*Create NUM_MAT buffers for parallel computing of Filter kernel*/
    for(int i = 0; i < NUM_MAT; i++)
    {
        FilterInput_buf[i] = cl::Buffer(context, CL_MEM_READ_ONLY, FilterInputbytes_per_iteration, NULL, &err);
        FilterOutput_buf[i] = cl::Buffer(context, CL_MEM_READ_ONLY, FilterOutputbytes_per_iteration, NULL, &err);
    }
     printf("after making buffer\n");
    unsigned char *FilterInPtr[NUM_MAT];
    unsigned char *FilterOutPtr[NUM_MAT];
    /*Assign the pointer of Filter input to output of Scaled array*/
    for(int i = 0; i < NUM_MAT; i++)
    {
        // FilterOutPtr[i] = (unsigned char*)q.enqueueMapBuffer(FilterOutput_buf[i], CL_TRUE, CL_MAP_WRITE, 0, FilterOutputbytes_per_iteration);
        // FilterInPtr[i] = (unsigned char*)q.enqueueMapBuffer(FilterInput_buf[i], CL_TRUE, CL_MAP_WRITE, 0, FilterInputbytes_per_iteration);
        printf("Input buffer allocated\n");
    }
    
     printf("before loading data");
    unsigned char *DifferentiateOut = (unsigned char *)malloc(FRAMES * OUTPUT_FRAME_SIZE);
    unsigned char *Output = (unsigned char *)malloc(FRAMES * MAX_OUTPUT_SIZE);
    
    Load_data(Input);
     printf("after making buffer");

    /*Compute scaling for FRAMES*/
    for(int frame = 0; frame < FRAMES; frame++)
    {
        printf("compressing %d frame",frame);
        FilterInPtr[0] = (unsigned char*)q.enqueueMapBuffer(FilterInput_buf[0], CL_TRUE, CL_MAP_WRITE, 0, FilterInputbytes_per_iteration);
        Scale_SW(Input + frame * INPUT_FRAME_SIZE,*(FilterInPtr + frame * SCALED_FRAME_SIZE));
        //Set arguments for Filter
        krnl_Filter.setArg(0, FilterInput_buf[frame%NUM_MAT]);
        krnl_Filter.setArg(1, FilterOutput_buf[frame%NUM_MAT]);
        
        if(frame == 0)
        {
            q.enqueueMigrateMemObjects({FilterInput_buf[frame%NUM_MAT]}, 0 /* 0 means from host*/, NULL, &write_done[frame]);
            write_waitlist.push_back(write_done[frame]);
        }
        else
        {
            q.enqueueMigrateMemObjects({FilterInput_buf[frame%NUM_MAT]}, 0 /* 0 means from host*/, &write_waitlist, &write_done[frame]);
            write_waitlist.push_back(write_done[frame]);
        }

        execute_waitlists[frame].push_back(write_done[frame]);
        q.enqueueTask(krnl_Filter, &execute_waitlists[frame], &execute_done[frame]);

        read_waitlists[frame].push_back(execute_done[frame]);
        q.enqueueMigrateMemObjects({FilterOutput_buf[frame%NUM_MAT]}, CL_MIGRATE_MEM_OBJECT_HOST, &read_waitlists[frame], &read_done[frame]);
        read_done[frame].wait();
        q.enqueueUnmapMemObject(FilterInput_buf[0],FilterInPtr[0]);
        FilterOutPtr[0] = (unsigned char*)q.enqueueMapBuffer(FilterOutput_buf[0], CL_TRUE, CL_MAP_WRITE, 0, FilterOutputbytes_per_iteration);
        Differentiate_SW(*(FilterOutPtr + (frame)%NUM_MAT),DifferentiateOut + (frame)*OUTPUT_FRAME_SIZE);
        q.enqueueUnmapMemObject(FilterOutput_buf[0],FilterOutPtr[0]);
        Size = Compress_SW(DifferentiateOut + (frame) * OUTPUT_FRAME_SIZE, Output);
           
    }
    q.finish();
    
    Store_data("Output_new.bin", Output, Size);
    Check_data(Output, Size);
    /*free memory*/
    free(Input);
    free(Output);
    free(DifferentiateOut);

}

