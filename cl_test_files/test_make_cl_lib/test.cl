#if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#elif defined(cl_amd_fp64)  // AMD extension available?
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#endif

#include "testhead.h"
#include "test_lib.h"

__kernel void draw(__global int* vec_len, t_vec vec)
{
	int gid = get_global_id(0);
	vec_len[gid] = bar(foo(vec));
}