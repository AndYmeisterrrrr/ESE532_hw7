#include <iostream>
#include <cstdlib>
#include <chrono>
#include "Pipeline.h"
#include <stdlib.h>


class stopwatch
{
public:
  double total_time, calls;
  std::chrono::time_point<std::chrono::high_resolution_clock> start_time, end_time;
  stopwatch() : total_time(0), calls(0){};

  inline void reset()
  {
    total_time = 0;
    calls = 0;
  }

  inline void start()
  {
    start_time = std::chrono::high_resolution_clock::now();
    calls++;
  };

  inline void stop()
  {
    end_time = std::chrono::high_resolution_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end_time - start_time).count();
    total_time += static_cast<double>(elapsed);
  };

  // return latency in ns
  inline double latency()
  {
    return total_time;
  };

  // return latency in ns
  inline double avg_latency()
  {
    return (total_time / calls);
  };
};


unsigned char * Create_Inmatrix(void)
{
	unsigned char * Matrix = static_cast<unsigned char *>(
      malloc(SCALED_FRAME_HEIGHT * SCALED_FRAME_WIDTH * sizeof(unsigned char)));
  if (Matrix == NULL)
  {
    std::cerr << "Could not allocate matrix." << std::endl;
    exit (EXIT_FAILURE);
  }
  return Matrix;
}




unsigned char * Create_Outmatrix(void)
{
	unsigned char * Matrix = static_cast<unsigned char *>(
      malloc(OUTPUT_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH * sizeof(unsigned char)));
  if (Matrix == NULL)
  {
    std::cerr << "Could not allocate matrix." << std::endl;
    exit (EXIT_FAILURE);
  }
  return Matrix;
}



void Destroy_matrix(unsigned char * Matrix)
{
  free(Matrix);
}

void Randomize_matrix(unsigned char * Matrix)
{
  for (int Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
    for (int X = 0; X < SCALED_FRAME_WIDTH; X++)
      Matrix[Y * SCALED_FRAME_WIDTH + X] = rand();
}




bool Compare_matrices(unsigned char *Matrix_1,
		              unsigned char *Matrix_2)
{
  bool Equal = true;
  for (int Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
    for (int X = 0; X < OUTPUT_FRAME_WIDTH; X++)
      if ((Matrix_1[Y * OUTPUT_FRAME_WIDTH + X] - Matrix_2[Y * OUTPUT_FRAME_WIDTH + X]) / Matrix_1[Y * OUTPUT_FRAME_WIDTH + X] > 0.01 ||
          (Matrix_1[Y * OUTPUT_FRAME_WIDTH + X] - Matrix_2[Y * OUTPUT_FRAME_WIDTH + X]) / Matrix_1[Y * OUTPUT_FRAME_WIDTH + X] < -0.01)
      {
        std::cout << (int)Matrix_1[Y * OUTPUT_FRAME_WIDTH + X] << "!=" << (int)Matrix_2[Y * OUTPUT_FRAME_WIDTH + X] << "row = "<<Y << ",col ="<<X<<std::endl;
        Equal = false;
      }
  return Equal;
}



int main()
{
  unsigned char *Input_1 = Create_Inmatrix();
  unsigned char *Output_SW = Create_Outmatrix();
  unsigned char *Output_HW = Create_Outmatrix();

  Randomize_matrix(Input_1);


  Filter_SW(Input_1,Output_SW);
  Filter_HW(Input_1,Output_HW);


  bool Equal = Compare_matrices(Output_SW, Output_HW);

  Destroy_matrix(Input_1);
  Destroy_matrix(Output_SW);
  Destroy_matrix(Output_HW);


  std::cout << "TEST " << (Equal ? "PASSED" : "FAILED") << std::endl;

  return Equal ? 0 : 1;
}
