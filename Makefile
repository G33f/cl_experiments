NAME			= test

SOURSE_DIRS		:= srcs srcs/test_nonkernal_func

FLAGS			= -Wall -Werror -Wextra

framework		= -framework OpenCL -framework AppKit -L libft -lft

SEARCH_WILDCARDS:= $(addsuffix /*.c, $(SOURSE_DIRS))

OBJECTS			= $(notdir $(patsubst %.c,%.o, $(wildcard $(SEARCH_WILDCARDS))))

LIB_DIR			= ./libft/

LIB_OBJS		= $(addprefix $(LIB_DIR), $(LIB_OBJ))

LIB_OBJ			= *.o

TEST_INC		= include/test.h

LIB_INC			= include/libft.h

all: $(NAME)

$(NAME): $(LIB_OBJS) $(OBJECTS) Makefile
	gcc $(OBJECTS) -o $@ $(framework)

$(LIB_DIR)%.o: $(LIB_DIR)%.c $(LIB_INC)
	make -C $(LIB_DIR)

VPATH := $(SOURSE_DIRS)

%.o: %.c $(TEST_INC)
	gcc $(FLAGS) -c $< -I include/

clean:
	make clean -C libft
	rm -rf *.o

fclean: clean
	make fclean -C libft
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
