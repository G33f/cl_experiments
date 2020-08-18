#if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#elif defined(cl_amd_fp64)  // AMD extension available?
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#endif

#include "../include/testhead.h"

t_vec	vec_diff(t_vec a, t_vec b)
{
	a.x -= b.x;
	a.y -= b.y;
	a.z -= b.z;
	return(a);
}

t_vec	vec_divis_cst(t_vec a, double t)
{
	a.x /= t;
	a.y /= t;
	a.z /= t;
	return (a);
}

t_vec	vec_scal_mult(t_vec a, t_vec b)
{
	a.x *= b.x;
	a.y *= b.y;
	a.z *= b.z;
	return(a);
}

double		vec_dot(t_vec a, t_vec b)
{
	a = vec_scal_mult(a, b);
	return(a.x + a.y + a.z);
}

double		vec_length(t_vec vec)
{
	return (sqrt(pow(vec.x, 2.0l) + pow(vec.y, 2.0l) + pow(vec.z, 2.0l)));
}