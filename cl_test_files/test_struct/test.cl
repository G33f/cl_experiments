#if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#elif defined(cl_amd_fp64)  // AMD extension available?
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#define DOUBLE_SUPPORT_AVAILABLE
#endif

typedef struct	s_vec
{
	float		x;
	float		y;
	float		z;
}				t_vec;

__kernel void draw(__global int* vec_len, t_vec vec)
{
	int gid = get_global_id(0);
	vec_len[gid] = (int)sqrt(pow(vec.x, 2) + pow(vec.y, 2) + pow(vec.z, 2));
}
