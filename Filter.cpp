#include "Pipeline.h"
#include <cstdlib>
#include <iostream>
#include <stdlib.h>
#include <hls_stream.h>

static unsigned Coefficients[] = {2, 15, 62, 98, 62, 15, 2};

 void Filter_horizontal_SW(const unsigned char * Input,
		                      unsigned char * Output)
{
  int X, Y, i;
  for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
      unsigned int Sum = 0;
      for (i = 0; i < FILTER_LENGTH; i++)
        Sum += Coefficients[i] * Input[Y * SCALED_FRAME_WIDTH + X + i];
      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    }
}



 void Filter_horizontal_HW(hls::stream< unsigned char>& inStream,
		                      hls::stream< unsigned char>& TempStream)
{
  int X, Y, i;
  unsigned char input_buffer[7];

  for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
  {
	    input_buffer[0]=inStream.read();
	  	input_buffer[1]=inStream.read();
	  	input_buffer[2]=inStream.read();
	  	input_buffer[3]=inStream.read();
	  	input_buffer[4]=inStream.read();
	  	input_buffer[5]=inStream.read();

    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
      input_buffer[6]=inStream.read();
      unsigned int Sum = 0;
      for (i = 0; i < FILTER_LENGTH; i++)
      {
		#pragma HLS PIPELINE
		#pragma HLS unroll
         Sum += Coefficients[i] * input_buffer[i];
      }
      TempStream << (Sum >> 8);
      for(i = 0; i < FILTER_LENGTH-1; i++)
      {
    	  input_buffer[i]=input_buffer[i+1];
      }
    }
  }
}



void Filter_vertical_HW(hls::stream< unsigned char>& TempStream,
		                      hls::stream<unsigned char>& outStream)
{

	  int X, Y, i,X_tmp,Y_tmp;
	  unsigned char Input_tmp[FILTER_LENGTH * OUTPUT_FRAME_WIDTH];
	  /*Buffer FILTER_LENGTH rows*/
	  for(Y = 0; Y < FILTER_LENGTH - 1; Y++)
		  for(X = 0; X < OUTPUT_FRAME_WIDTH; X++)
			  Input_tmp[Y*OUTPUT_FRAME_WIDTH + X] = TempStream.read();
	  /*Filter Vertical calculation*/
	  for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
	  {
	    /*Read one new row every cycle*/
		for(X_tmp = 0; X_tmp < OUTPUT_FRAME_WIDTH; X_tmp++)
			Input_tmp[(FILTER_LENGTH - 1)*OUTPUT_FRAME_WIDTH + X_tmp] = TempStream.read();
		for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
	    {
		  unsigned int Sum = 0;
	      for (i = 0; i < FILTER_LENGTH; i++)
	      {
#pragma HLS PIPELINE
#pragma HLS unroll
	        Sum += Coefficients[i] * Input_tmp[(i) * OUTPUT_FRAME_WIDTH + X];
	      }
	      outStream << (Sum >> 8);
	    }
       /*Shift Input_tmp by one column*/
	    for(Y_tmp = 0; Y_tmp < FILTER_LENGTH - 1; Y_tmp++ )
	    	for(X_tmp = 0; X_tmp < OUTPUT_FRAME_WIDTH; X_tmp++)
	    	{
	    		Input_tmp[Y_tmp*OUTPUT_FRAME_WIDTH + X_tmp] = Input_tmp[(Y_tmp + 1)*OUTPUT_FRAME_WIDTH + X_tmp];
	    	}
	  }
}


 void Filter_vertical_SW( unsigned char * Input,
 		                    unsigned char * Output)
 {
	  int X, Y, i;
	  for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
	    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
	    {
	      unsigned int Sum = 0;
	      for (i = 0; i < FILTER_LENGTH; i++)
	        Sum += Coefficients[i] * Input[(Y + i) * OUTPUT_FRAME_WIDTH + X];
	      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
	    }
 }



void Filter_SW( unsigned char * Input,
	           unsigned char * Output)
{
  unsigned char * Temp = (unsigned char *) malloc(SCALED_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH);
  Filter_horizontal_SW(Input, Temp);
  Filter_vertical_SW(Temp, Output);
  free(Temp);
}


static void read_input( unsigned char * Input, hls::stream< unsigned char>& inStream) {
  mem_rd:
    for (int i = 0; i < (SCALED_FRAME_HEIGHT * SCALED_FRAME_WIDTH); i++){
#pragma HLS PIPELINE
    inStream << Input[i];
    }
}

// Read result from outStream and write the result to Global Memory
static void write_output(unsigned char* out, hls::stream<unsigned char>& outStream) {
// Auto-pipeline is going to apply pipeline to this loop
mem_wr:
    for (int i = 0; i < OUTPUT_FRAME_HEIGHT*OUTPUT_FRAME_WIDTH; i++) {
        // Blocking read command to inStream
        out[i] = outStream.read();
    }
}


void Filter_HW( unsigned char * Input,
	           unsigned char * Output)
{
#pragma HLS INTERFACE m_axi port=Input bundle=aximm1
#pragma HLS INTERFACE m_axi port=Output bundle=aximm1
    static hls::stream<unsigned char> inStream("input_stream");
    static hls::stream<unsigned char> TempStream("temp_stream");
    static hls::stream<unsigned char> outStream("output_stream");
#pragma HLS STREAM variable = inStream depth=32
#pragma HLS STREAM variable = TempStream depth=32
#pragma HLS STREAM variable = outStream depth=32
#pragma HLS Dataflow   
    read_input(Input, inStream);
    Filter_horizontal_HW(inStream,TempStream);
    Filter_vertical_HW(TempStream,outStream);
    write_output(Output,outStream);
}

