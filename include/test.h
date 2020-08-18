#ifndef TEST_H
# define TEST_H

# define BUFFSIZE		4096
# define WIN_SIZE_X		1024
# define WIN_SIZE_Y		720

# include <OpenCL/cl.h>
# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>
# include "libft.h"
# include "mlx.h"

typedef struct			s_vec
{
	float				x;
	float				y;
	float				z;
}						t_vec;

typedef struct			s_mlx
{
	void				*mlx;
	void				*win;
}						t_mlx;

typedef struct			s_img
{
	int					img_size_x;
	int					img_size_y;
	void				*img;
	int 				*img_data;
	int					bpp;
	int					sl;
	int					el;
}						t_img;

typedef struct 			s_sphere
{
	t_vec				chenter;
	float 				r;
	int 				color;
}						t_sphere;

typedef struct			s_rend_par
{
	t_sphere 			sphere;
	t_vec 				camera_c;
	t_img 				conv;
}						t_rend_par;

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
	t_mlx				mlx;
	t_img				win_img;
	t_img				conv;
	t_cl				cl;
	t_rend_par 			r_p;
	int 				*buf;
}						t_data;

#endif