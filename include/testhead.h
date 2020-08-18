#ifndef TESTHEAD_H

# define TESTHEAD_H

typedef struct	s_vec
{
	float		x;
	float		y;
	float		z;
}				t_vec;

typedef struct 	s_sphere
{
	t_vec		chenter;
	float 		r;
	int 		color;
}				t_sphere;

typedef struct	s_img
{
	int			img_size_x;
	int			img_size_y;
	void		*img;
	int 		*img_data;
	int			bpp;
	int			sl;
	int			el;
}				t_img;

typedef struct	s_rend_par
{
	t_sphere 	sphere;
	t_vec 		camera_c;
	t_img 		conv;
}				t_rend_par;

double			vec_length(t_vec a);
int 			bar(int i);
t_vec			vec_diff(t_vec a, t_vec b);
t_vec			vec_divis_cst(t_vec a, double t);
double			vec_dot(t_vec a, t_vec b);
t_vec			vec_scal_mult(t_vec a, t_vec b);
int				ray_tracing(t_rend_par p, t_vec r);

#endif