NAME			= test

SOURSE_DIRS		:= srcs srcs/test_make_cl_lib

FLAGS			= -Wall -Werror -Wextra

framework		= -L minilibx_macos -lmlx -framework OpenCL -framework OpenGL -framework AppKit -L libft -lft

SEARCH_WILDCARDS:= $(addsuffix /*.c, $(SOURSE_DIRS))

OBJECTS			= $(notdir $(patsubst %.c,%.o, $(wildcard $(SEARCH_WILDCARDS))))

LIB_DIR			= ./libft/

LIB_OBJS		= $(addprefix $(LIB_DIR), $(LIB_OBJ))

LIB_OBJ			= *.o

TEST_INC		= include/test.h

LIB_INC			= include/libft.h

LIB_MLX_FILE	=	minilibx_macos/libmlx.a

all: $(NAME)

$(NAME): $(LIB_OBJS) $(LIB_MLX_FILE) $(OBJECTS)
	gcc $(OBJECTS) -o $@ $(framework)

$(LIB_DIR)%.o: $(LIB_DIR)%.c $(LIB_INC)
	make -C $(LIB_DIR)

$(LIB_MLX_FILE):
	make -C minilibx_macos

VPATH := $(SOURSE_DIRS)

%.o: %.c $(TEST_INC) Makefile
	gcc $(FLAGS) -c $< -I include/

clean:
	make clean -C $(LIB_DIR)
	make clean -C minilibx_macos
	rm -rf *.o

fclean: clean
	make fclean -C libft
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
