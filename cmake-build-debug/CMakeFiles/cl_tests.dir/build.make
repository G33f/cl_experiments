# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/wpoudre/Desktop/cl_tests

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/wpoudre/Desktop/cl_tests/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/cl_tests.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/cl_tests.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cl_tests.dir/flags.make

CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.o: CMakeFiles/cl_tests.dir/flags.make
CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.o: ../srcs/test_struct/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/wpoudre/Desktop/cl_tests/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.o   -c /Users/wpoudre/Desktop/cl_tests/srcs/test_struct/main.c

CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/wpoudre/Desktop/cl_tests/srcs/test_struct/main.c > CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.i

CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/wpoudre/Desktop/cl_tests/srcs/test_struct/main.c -o CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.s

# Object files for target cl_tests
cl_tests_OBJECTS = \
"CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.o"

# External object files for target cl_tests
cl_tests_EXTERNAL_OBJECTS =

cl_tests: CMakeFiles/cl_tests.dir/srcs/test_struct/main.c.o
cl_tests: CMakeFiles/cl_tests.dir/build.make
cl_tests: CMakeFiles/cl_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/wpoudre/Desktop/cl_tests/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable cl_tests"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cl_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cl_tests.dir/build: cl_tests

.PHONY : CMakeFiles/cl_tests.dir/build

CMakeFiles/cl_tests.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cl_tests.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cl_tests.dir/clean

CMakeFiles/cl_tests.dir/depend:
	cd /Users/wpoudre/Desktop/cl_tests/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/wpoudre/Desktop/cl_tests /Users/wpoudre/Desktop/cl_tests /Users/wpoudre/Desktop/cl_tests/cmake-build-debug /Users/wpoudre/Desktop/cl_tests/cmake-build-debug /Users/wpoudre/Desktop/cl_tests/cmake-build-debug/CMakeFiles/cl_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cl_tests.dir/depend

