#if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#elif defined(cl_amd_fp64)  // AMD extension available?
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#endif

#include "testhead.h"
#include "test_lib.h"

__kernel void draw(__global int* pixel, t_rend_par p)
{
	double	x;
	double	y;
	int		gid;

	gid = get_global_id(0);
	y = (double)(gid / p.conv.img_size_y) - p.conv.img_size_y / 2;
	x = (double)(gid % p.conv.img_size_x) - p.conv.img_size_x / 2;

	pixel[gid] = ray_tracing(p, (t_vec){x, y, p.conv.img_size_y});
}



