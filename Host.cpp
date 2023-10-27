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
    EventTimer timer1, timer2;
    timer1.add("Main program");

    cl::Buffer FilterInput_buf;
    cl::Buffer FilterOutput_buf;
    unsigned char *FilterInPtr;
    unsigned char *FilterOutPtr;

    size_t FilterInputbytes_per_iteration = (SCALED_FRAME_SIZE * sizeof(unsigned char));
    size_t FilterOutputbytes_per_iteration = (OUTPUT_FRAME_SIZE * sizeof(unsigned char));
    //  printf("before allocatig buffer\n");

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
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::Kernel krnl_Filter(program, "Filter_HW", &err);
     
    // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
    timer2.add("Allocate contiguous OpenCL buffers");
    /*Create NUM_MAT buffers for parallel computing of Filter kernel*/
    FilterInput_buf = cl::Buffer(context, CL_MEM_READ_ONLY, FilterInputbytes_per_iteration, NULL, &err);
    FilterOutput_buf = cl::Buffer(context, CL_MEM_READ_ONLY, FilterOutputbytes_per_iteration, NULL, &err);
    //  printf("after allocating buffer\n");
    /*Assign the pointer of Filter input to output of Scaled array*/
    FilterOutPtr = (unsigned char*)q.enqueueMapBuffer(FilterOutput_buf, CL_TRUE, CL_MAP_WRITE, 0, FilterOutputbytes_per_iteration);
    FilterInPtr = (unsigned char*)q.enqueueMapBuffer(FilterInput_buf, CL_TRUE, CL_MAP_WRITE, 0, FilterInputbytes_per_iteration);
    
    //  printf("after allocating pointer\n");
    unsigned char *Input = (unsigned char *)malloc(FRAMES * INPUT_FRAME_SIZE);
    // printf("before load data\n");
    timer2.add("Populating buffer inputs");
    Load_data(Input);
    // printf("after load data\n");
    unsigned char *DifferentiateOut = (unsigned char *)malloc(FRAMES * OUTPUT_FRAME_SIZE);
    unsigned char *Output = (unsigned char *)malloc(FRAMES * MAX_OUTPUT_SIZE);    
    //  printf("after assigning all the needed memory\n");
  
    int Size = 0;/*To store total length of compressed output of all frames combined*/
    timer2.add("Running kernel");
    
    std::vector<cl::Event> read_done(FRAMES);    // host perspective 
    std::vector<cl::Event> write_done(FRAMES);
    std::vector<cl::Event> execute_done(FRAMES); // host perspective 
    std::vector<cl::Event> write_waitlist;
    std::vector<std::vector<cl::Event>> execute_waitlists(FRAMES);
    std::vector<std::vector<cl::Event>> read_waitlists(FRAMES);

    // printf("assigned all the vector of waitlists and events needed");


    /*Compute scaling for FRAMES*/
    for(int frame = 0; frame < FRAMES; frame++)
    {
        // printf("compressing %d frame\n",frame);
        Scale_SW(Input + frame * INPUT_FRAME_SIZE,FilterInPtr);
        //Set arguments for Filter
        // printf("Setting kernel arguments\n");
        krnl_Filter.setArg(0, FilterInput_buf);
        krnl_Filter.setArg(1, FilterOutput_buf);
        
        if(frame == 0)
        {
            q.enqueueMigrateMemObjects({FilterInput_buf}, 0 /* 0 means from host*/, NULL, &write_done[frame]);
            write_waitlist.push_back(write_done[frame]);
        }
        else
        {
            q.enqueueMigrateMemObjects({FilterInput_buf}, 0 /* 0 means from host*/, &write_waitlist, &write_done[frame]);
            write_waitlist.push_back(write_done[frame]);
        }
        // printf("write done\n");
        execute_waitlists[frame].push_back(write_done[frame]);
        q.enqueueTask(krnl_Filter, &execute_waitlists[frame], &execute_done[frame]);
        // printf("execution done\n");
        read_waitlists[frame].push_back(execute_done[frame]);
        q.enqueueMigrateMemObjects({FilterOutput_buf}, CL_MIGRATE_MEM_OBJECT_HOST, &read_waitlists[frame], &read_done[frame]);

        read_done[frame].wait();
        // printf("Filtering done\n");
        Differentiate_SW(FilterOutPtr,DifferentiateOut + (frame)*OUTPUT_FRAME_SIZE);
        // printf("Differentiate done\n");
        Size = Compress_SW(DifferentiateOut + (frame) * OUTPUT_FRAME_SIZE, Output);
        // printf("Compression done\n");
           
    }
    q.finish();
    timer2.add("Writing output to output_fpga.bin");
    Store_data("Output_new.bin", Output, Size);
    // printf("storing data done fr size = %d\n",Size);
    Check_data(Output, Size);
    // printf("Checking done\n");
    // /*free memory*/
    free(Input);
    free(Output);
    free(DifferentiateOut);
    delete[] fileBuf;

    timer2.finish();
    std::cout << "--------------- Key execution times ---------------"
    << std::endl;
    timer2.print();

    timer1.finish();
    std::cout << "--------------- Total time ---------------"
    << std::endl;
    timer1.print();
}

