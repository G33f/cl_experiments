#ifndef TEST_H
# define TEST_H

# define BUFFSIZE 4096

# include <OpenCL/cl.h>
# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>
# include "libft.h"

typedef struct			s_vec
{
	float				x;
	float				y;
	float				z;
}						t_vec;

typedef struct			s_cl
{
	cl_int				ret;
	cl_platform_id		pid;
	cl_uint				ret_num_p;
	cl_device_id		did;
	cl_uint				ret_num_d;
	cl_context			context;
	cl_command_queue	c_cueue;
	cl_program			program;
	cl_kernel			kernal;
	cl_mem				mobj;
}						t_cl;

typedef struct			s_data
{
	t_cl				cl;
	int 				*buf;
}						t_data;

#endif