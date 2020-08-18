#include "test.h"

void	error(int code)
{
	if (code)
	{
		printf("%d\nsomthing gows wrong\n",code);
		exit(code);
	}
}

void		cl_set_args(t_data p, t_rend_par par)
{
	p.cl.ret = clSetKernelArg(p.cl.kernal, 1, sizeof(t_rend_par), &par);
	error(p.cl.ret);
}

void	draw(t_data *p)
{
	int		mem_len;
	size_t	global_work_size;

	mem_len = p->r_p.conv.img_size_x * p->r_p.conv.img_size_y;
	global_work_size = p->r_p.conv.img_size_x * p->r_p.conv.img_size_y;;
	cl_set_args(*p, p->r_p);
	p->cl.ret = clEnqueueNDRangeKernel(p->cl.c_cueue, p->cl.kernal, 1, NULL, &global_work_size, NULL, 0, NULL, NULL);
	error(p->cl.ret);
	p->cl.ret = clEnqueueReadBuffer(p->cl.c_cueue, p->cl.mobj, CL_TRUE, 0, mem_len * sizeof(int), p->r_p.conv.img_data, 0, NULL, NULL);
	error(p->cl.ret);
}

size_t	read_cl_src(char **src, char *file_name)
{
	int		fd;
	size_t	source_size;
	char	*source_str;
	char	*buf;
	int		ret;

	if (!(buf = malloc(sizeof(char) * (BUFFSIZE + 1))))
		exit(-1);
	fd = open(file_name, O_RDONLY);
	if (!(source_str = ft_strnew(0)))
		exit(-1);
	while ((ret = read(fd, buf, BUFFSIZE)) > 0)
	{
		buf[ret] = '\0';
		source_str = ft_strjoinfree(&source_str, &buf, 1);
	}
	free(buf);
	source_size = ft_strlen(source_str);
	*src = source_str;
	return (source_size);
}

t_data	cl_krenal_creat(t_data p, char *f_name)
{
	size_t	src_size;
	size_t	log_size;
	char	*src;
	char	*log;
	const char option[] = "-I ./include/ -I ./clvlib/";

	src_size = read_cl_src(&src, f_name);
	p.cl.program = clCreateProgramWithSource(p.cl.context, 1, (const char **)&src, (const size_t *)&src_size, &p.cl.ret);
	error(p.cl.ret);
	p.cl.ret = clBuildProgram(p.cl.program, 1, &p.cl.did, option, NULL, NULL);
	//error(p.cl.ret);
	clGetProgramBuildInfo(p.cl.program, p.cl.did, CL_PROGRAM_BUILD_LOG, 0, NULL, &log_size);
	if (!(log = malloc(sizeof(char) * log_size)))
		error(1);
	clGetProgramBuildInfo(p.cl.program, p.cl.did, CL_PROGRAM_BUILD_LOG, log_size, log, NULL);
	printf("%s", log);
	error(p.cl.ret);
	p.cl.kernal = clCreateKernel(p.cl.program, "draw", &p.cl.ret);
	error(p.cl.ret);
	free(src);
	free(log);
	return (p);
}

t_data	cl_buffer(t_data p)
{
	int		mem_len;

	mem_len = p.conv.img_size_y * p.conv.img_size_x;
	p.cl.mobj = clCreateBuffer(p.cl.context, CL_MEM_READ_WRITE, mem_len * sizeof(cl_int), NULL, &p.cl.ret);
	error(p.cl.ret);
	p.cl.ret = clEnqueueWriteBuffer(p.cl.c_cueue, p.cl.mobj, CL_TRUE, 0, mem_len * sizeof(cl_int), p.conv.img_data, 0, NULL, NULL);
	error(p.cl.ret);
	p.cl.ret = clSetKernelArg(p.cl.kernal, 0, sizeof(cl_mem), (void *)&p.cl.mobj);
	error(p.cl.ret);
	return (p);
}

t_data	init_test(t_data params)
{
	params = cl_krenal_creat(params, "cl_test_files/test_nontextur_sphere/test.cl");
	error(params.cl.ret);
	return (params);
}

t_cl	cl_init(void)
{
	t_cl	cl;

	cl.ret = clGetPlatformIDs(2, &cl.pid, &cl.ret_num_p);
	error(cl.ret);
	cl.ret = clGetDeviceIDs(cl.pid, CL_DEVICE_TYPE_GPU, 1, &cl.did, &cl.ret_num_d);
	error(cl.ret);
	cl.context = clCreateContext(NULL, 1, &cl.did, NULL, NULL, &cl.ret);
	error(cl.ret);
	cl.c_cueue = clCreateCommandQueue(cl.context, cl.did, 0, &cl.ret);
	error(cl.ret);
	return (cl);
}

void	img_init(t_img *img, void *mlx, int img_size_x, int img_size_y)
{
	img->img_size_x = img_size_x;
	img->img_size_y = img_size_y;
	img->img = mlx_new_image(mlx, img->img_size_x, img->img_size_y);
	img->img_data = (int *)mlx_get_data_addr(img->img, &img->bpp, &img->sl, &img->el);
}

void	m_mlx_init(t_data *p)
{
	p->mlx.mlx = mlx_init();
	p->mlx.win = mlx_new_window(p->mlx.mlx, WIN_SIZE_X, WIN_SIZE_Y, "test_sper");
	img_init(&p->win_img, p->mlx.mlx, WIN_SIZE_X, WIN_SIZE_Y);
}

int	drow(t_data *p)
{
	int x;
	int y;

	y = 0;
	while (y < WIN_SIZE_Y)
	{
		x = 0;
		while (x < WIN_SIZE_X)
		{
			p->win_img.img_data[x + y * WIN_SIZE_X] =p->conv.img_data[(x *
				p->conv.img_size_x / WIN_SIZE_X) + p->conv.img_size_x *
						(y * p->conv.img_size_y / WIN_SIZE_Y)];
			x++;
		}
		y++;
	}
	return(0);
}

int	main()
{
	t_data	p;
	t_sphere s;

	p.cl = cl_init();
	m_mlx_init(&p);
	*p.buf = 0;
	s = (t_sphere){(t_vec){0,0, 5}, 1.0f, 0xFF0000};
	img_init(&p.conv, p.mlx.mlx, WIN_SIZE_X, WIN_SIZE_X);
	p.r_p = (t_rend_par){s, (t_vec){0,0, 0}, p.conv};
	p = init_test(p);
	p = cl_buffer(p);
	draw(&p);
	drow(&p);
	mlx_put_image_to_window(p.mlx.mlx, p.mlx.win, p.win_img.img, 0, 0);
	mlx_loop(p.mlx.mlx);
	clReleaseMemObject(p.cl.mobj);
	return (0);
}