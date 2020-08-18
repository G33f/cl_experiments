#if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#elif defined(cl_amd_fp64)  // AMD extension available?
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#endif

#include "../../include/testhead.h"

int foo(t_vec vec)
{
	return ((int)sqrt(pow(vec.x, 2.0l) + pow(vec.y, 2.0l) + pow(vec.z, 2.0l)));
}