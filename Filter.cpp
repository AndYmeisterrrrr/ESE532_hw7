#include "Pipeline.h"
#include <stdlib.h>

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

/*void Filter_horizontal_HW(const unsigned char * Input,
		                      unsigned char * Output)
{
  int X, Y, i;
  for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
      unsigned int Sum = 0;
      for (i = 0; i < FILTER_LENGTH; i++)
#pragma HLS PIPELINE
        Sum += Coefficients[i] * Input[Y * SCALED_FRAME_WIDTH + X + i];
      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    }
}*/



 void Filter_horizontal_HW(const unsigned char * Input,
		                      unsigned char * Output)
{
  int X, Y, i;
  unsigned char input_buffer[7];

  for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
  {
	    input_buffer[0]=Input[Y* SCALED_FRAME_WIDTH+0];
	  	input_buffer[1]=Input[Y* SCALED_FRAME_WIDTH+1];
	  	input_buffer[2]=Input[Y* SCALED_FRAME_WIDTH+2];
	  	input_buffer[3]=Input[Y* SCALED_FRAME_WIDTH+3];
	  	input_buffer[4]=Input[Y* SCALED_FRAME_WIDTH+4];
	  	input_buffer[5]=Input[Y* SCALED_FRAME_WIDTH+5];

    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
      input_buffer[6]=Input[Y * SCALED_FRAME_WIDTH + X + 6];
      unsigned int Sum = 0;
      for (i = 0; i < FILTER_LENGTH; i++)
      {
		#pragma HLS PIPELINE
		#pragma HLS unroll
         Sum += Coefficients[i] * input_buffer[i];
      }
      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
      for(i = 0; i < FILTER_LENGTH-1; i++)
      {
    	  input_buffer[i]=input_buffer[i+1];
      }
    }

}
}


 void Filter_vertical_SW(const unsigned char * Input,
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



void Filter_vertical_HW(const unsigned char * Input,
		                    unsigned char * Output)
{
  int X, Y, i;
  unsigned char input_buffer[7];
  for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
  {
	    input_buffer[0]=Input[0*OUTPUT_FRAME_WIDTH+X];
	  	input_buffer[1]=Input[1*OUTPUT_FRAME_WIDTH+X];
	  	input_buffer[2]=Input[2*OUTPUT_FRAME_WIDTH+X];
	  	input_buffer[3]=Input[3*OUTPUT_FRAME_WIDTH+X];
	  	input_buffer[4]=Input[4*OUTPUT_FRAME_WIDTH+X];
	  	input_buffer[5]=Input[5*OUTPUT_FRAME_WIDTH+X];

    for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
    {
      input_buffer[6]=Input[(Y+6)*OUTPUT_FRAME_WIDTH+X];
      unsigned int Sum = 0;

      for (i = 0; i < FILTER_LENGTH; i++)
      {
		#pragma HLS PIPELINE
		#pragma HLS unroll
        Sum += Coefficients[i] * input_buffer[i];
      }
      Output[Y*OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
      for(i = 0; i < FILTER_LENGTH-1; i++)
      {
    	  input_buffer[i]=input_buffer[i+1];
      }
    }
}
}





void Filter_SW(const unsigned char * Input,
	           unsigned char * Output)
{
  unsigned char * Temp = (unsigned char *) malloc(SCALED_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH);
  Filter_horizontal_SW(Input, Temp);
  Filter_vertical_SW(Temp, Output);
  free(Temp);
}
