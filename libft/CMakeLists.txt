cmake_minimum_required(VERSION 3.10)

set(CMAKE_C_STANDARD  90)
set(CMAKE_C_STANDARD_REQUIRED True)

# set the project name
project(ft)

#file(GLOB SOURCES "src/*.c")

# find .     -type f -name '*.c' | sed 'N;N;s/\n/ /g' |  sed '$s/\\\\\\//' | column -t
set(${PROJECT_NAME}_SOURCES
        ./ft_alpdown.c     ./ft_alpup.c      ./ft_atoi.c
        ./ft_bzero.c       ./ft_cu_wards.c   ./ft_isalnum.c
        ./ft_isalpha.c     ./ft_isascii.c    ./ft_isdigit.c
        ./ft_isprint.c     ./ft_itoa.c       ./ft_lstadd.c
        ./ft_lstdel.c      ./ft_lstdelone.c  ./ft_lstiter.c
        ./ft_lstmap.c      ./ft_lstnelem.c   ./ft_lstnew.c
        ./ft_matcp.c       ./ft_matdel.c     ./ft_memalloc.c
        ./ft_memccpy.c     ./ft_memchr.c     ./ft_memcmp.c
        ./ft_memcpy.c      ./ft_memdel.c     ./ft_memmove.c
        ./ft_memset.c      ./ft_pow.c        ./ft_putchar.c
        ./ft_putchar_fd.c  ./ft_putendl.c    ./ft_putendl_fd.c
        ./ft_putmat.c      ./ft_putnbr.c     ./ft_putnbr_fd.c
        ./ft_putstr.c      ./ft_putstr_fd.c  ./ft_sqrt.c
        ./ft_strcat.c      ./ft_strchr.c     ./ft_strclr.c
        ./ft_strcmp.c      ./ft_strcpy.c     ./ft_strdel.c
        ./ft_strdup.c      ./ft_strequ.c     ./ft_striter.c
        ./ft_striteri.c    ./ft_strjoin.c    ./ft_strjoinfree.c
        ./ft_strlcat.c     ./ft_strlen.c     ./ft_strmap.c
        ./ft_strmapi.c     ./ft_strncat.c    ./ft_strncmp.c
        ./ft_strncpy.c     ./ft_strndup.c    ./ft_strnequ.c
        ./ft_strnew.c      ./ft_strnstr.c    ./ft_strrchr.c
        ./ft_strsplit.c    ./ft_strstr.c     ./ft_strsub.c
        ./ft_strtrim.c     ./ft_tolower.c    ./ft_toupper.c
        )

#target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include )
include_directories(${PROJECT_SOURCE_DIR}/include )

add_library(${PROJECT_NAME} ${${PROJECT_NAME}_SOURCES})

#add_subdirectory(src)