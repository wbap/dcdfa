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

# Utility rule file for stddeque.

# Include the progress variables for this target.
include test/CMakeFiles/stddeque.dir/progress.make

stddeque: test/CMakeFiles/stddeque.dir/build.make

.PHONY : stddeque

# Rule to build all files generated by this target.
test/CMakeFiles/stddeque.dir/build: stddeque

.PHONY : test/CMakeFiles/stddeque.dir/build

test/CMakeFiles/stddeque.dir/clean:
	cd /home/kotone/dfa/eigen/build/test && $(CMAKE_COMMAND) -P CMakeFiles/stddeque.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/stddeque.dir/clean

test/CMakeFiles/stddeque.dir/depend:
	cd /home/kotone/dfa/eigen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kotone/dfa/eigen /home/kotone/dfa/eigen/test /home/kotone/dfa/eigen/build /home/kotone/dfa/eigen/build/test /home/kotone/dfa/eigen/build/test/CMakeFiles/stddeque.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/stddeque.dir/depend

