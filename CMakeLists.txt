cmake_minimum_required(VERSION 3.1)
project(cl_tests)

set(CMAKE_C_STANDARD 99)

find_package(OpenCL REQUIRED)
include_directories(${OpenCL_INCLUDE_DIRS})
link_directories(${OpenCL_LIBRARY})

#target_include_directories(cl_tests PUBLIC
#        ./libft/include      )

add_subdirectory(libft)

include_directories(include)

add_executable(cl_tests
        srcs/main.c)

target_include_directories (cl_tests PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries (cl_tests ${OpenCL_LIBRARY})
