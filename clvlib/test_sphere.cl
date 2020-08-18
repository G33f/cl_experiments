#if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#elif defined(cl_amd_fp64)  // AMD extension available?
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#endif

#include "../include/testhead.h"

int	ray_tracing(t_rend_par p, t_vec r)
{
	t_vec	d;
	t_vec	oc;
	float	disk;
	float	t1;
	float	t2;
	float	t_max;
	float	t_min;

	t_max = 2000000000.0f;
	t_min = 0.0f;
	d = vec_diff(r, p.camera_c);
	oc = vec_diff(p.camera_c, p.sphere.chenter);
	d = vec_divis_cst(d, vec_length(d));
	disk = (pow((2 * vec_dot(oc, d)), 2) - (4 * vec_dot(d, d) *(vec_dot(oc, oc) - pow(p.sphere.r, 2))));
	if (disk <= 0)
		return (0);
	t1 = ((-2 * vec_dot(oc, d)) + sqrt(disk)) / (2 * vec_dot(d, d));
	t2 = ((-2 * vec_dot(oc, d)) - sqrt(disk)) / (2 * vec_dot(d, d));
	t1 = max(t1, t2);
	if (t1 < t_max && t1 > t_min)
	{
		t_max = t1;
		return (p.sphere.color);
	}
	return (0);
}