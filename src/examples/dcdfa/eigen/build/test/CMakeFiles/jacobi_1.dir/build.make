# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.3

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /home/kotone/bin/cmake

# The command to remove a file.
RM = /home/kotone/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kotone/dfa/eigen

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kotone/dfa/eigen/build

# Include any dependencies generated for this target.
include test/CMakeFiles/jacobi_1.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/jacobi_1.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/jacobi_1.dir/flags.make

test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o: test/CMakeFiles/jacobi_1.dir/flags.make
test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o: ../test/jacobi.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kotone/dfa/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o"
	cd /home/kotone/dfa/eigen/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/jacobi_1.dir/jacobi.cpp.o -c /home/kotone/dfa/eigen/test/jacobi.cpp

test/CMakeFiles/jacobi_1.dir/jacobi.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jacobi_1.dir/jacobi.cpp.i"
	cd /home/kotone/dfa/eigen/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kotone/dfa/eigen/test/jacobi.cpp > CMakeFiles/jacobi_1.dir/jacobi.cpp.i

test/CMakeFiles/jacobi_1.dir/jacobi.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jacobi_1.dir/jacobi.cpp.s"
	cd /home/kotone/dfa/eigen/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kotone/dfa/eigen/test/jacobi.cpp -o CMakeFiles/jacobi_1.dir/jacobi.cpp.s

test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o.requires:

.PHONY : test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o.requires

test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o.provides: test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/jacobi_1.dir/build.make test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o.provides.build
.PHONY : test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o.provides

test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o.provides.build: test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o


# Object files for target jacobi_1
jacobi_1_OBJECTS = \
"CMakeFiles/jacobi_1.dir/jacobi.cpp.o"

# External object files for target jacobi_1
jacobi_1_EXTERNAL_OBJECTS =

test/jacobi_1: test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o
test/jacobi_1: test/CMakeFiles/jacobi_1.dir/build.make
test/jacobi_1: test/CMakeFiles/jacobi_1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kotone/dfa/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable jacobi_1"
	cd /home/kotone/dfa/eigen/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/jacobi_1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/jacobi_1.dir/build: test/jacobi_1

.PHONY : test/CMakeFiles/jacobi_1.dir/build

test/CMakeFiles/jacobi_1.dir/requires: test/CMakeFiles/jacobi_1.dir/jacobi.cpp.o.requires

.PHONY : test/CMakeFiles/jacobi_1.dir/requires

test/CMakeFiles/jacobi_1.dir/clean:
	cd /home/kotone/dfa/eigen/build/test && $(CMAKE_COMMAND) -P CMakeFiles/jacobi_1.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/jacobi_1.dir/clean

test/CMakeFiles/jacobi_1.dir/depend:
	cd /home/kotone/dfa/eigen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kotone/dfa/eigen /home/kotone/dfa/eigen/test /home/kotone/dfa/eigen/build /home/kotone/dfa/eigen/build/test /home/kotone/dfa/eigen/build/test/CMakeFiles/jacobi_1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/jacobi_1.dir/depend

