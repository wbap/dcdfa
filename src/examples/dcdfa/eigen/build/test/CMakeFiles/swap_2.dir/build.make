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
include test/CMakeFiles/swap_2.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/swap_2.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/swap_2.dir/flags.make

test/CMakeFiles/swap_2.dir/swap.cpp.o: test/CMakeFiles/swap_2.dir/flags.make
test/CMakeFiles/swap_2.dir/swap.cpp.o: ../test/swap.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kotone/dfa/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/swap_2.dir/swap.cpp.o"
	cd /home/kotone/dfa/eigen/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/swap_2.dir/swap.cpp.o -c /home/kotone/dfa/eigen/test/swap.cpp

test/CMakeFiles/swap_2.dir/swap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/swap_2.dir/swap.cpp.i"
	cd /home/kotone/dfa/eigen/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kotone/dfa/eigen/test/swap.cpp > CMakeFiles/swap_2.dir/swap.cpp.i

test/CMakeFiles/swap_2.dir/swap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/swap_2.dir/swap.cpp.s"
	cd /home/kotone/dfa/eigen/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kotone/dfa/eigen/test/swap.cpp -o CMakeFiles/swap_2.dir/swap.cpp.s

test/CMakeFiles/swap_2.dir/swap.cpp.o.requires:

.PHONY : test/CMakeFiles/swap_2.dir/swap.cpp.o.requires

test/CMakeFiles/swap_2.dir/swap.cpp.o.provides: test/CMakeFiles/swap_2.dir/swap.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/swap_2.dir/build.make test/CMakeFiles/swap_2.dir/swap.cpp.o.provides.build
.PHONY : test/CMakeFiles/swap_2.dir/swap.cpp.o.provides

test/CMakeFiles/swap_2.dir/swap.cpp.o.provides.build: test/CMakeFiles/swap_2.dir/swap.cpp.o


# Object files for target swap_2
swap_2_OBJECTS = \
"CMakeFiles/swap_2.dir/swap.cpp.o"

# External object files for target swap_2
swap_2_EXTERNAL_OBJECTS =

test/swap_2: test/CMakeFiles/swap_2.dir/swap.cpp.o
test/swap_2: test/CMakeFiles/swap_2.dir/build.make
test/swap_2: test/CMakeFiles/swap_2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kotone/dfa/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable swap_2"
	cd /home/kotone/dfa/eigen/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/swap_2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/swap_2.dir/build: test/swap_2

.PHONY : test/CMakeFiles/swap_2.dir/build

test/CMakeFiles/swap_2.dir/requires: test/CMakeFiles/swap_2.dir/swap.cpp.o.requires

.PHONY : test/CMakeFiles/swap_2.dir/requires

test/CMakeFiles/swap_2.dir/clean:
	cd /home/kotone/dfa/eigen/build/test && $(CMAKE_COMMAND) -P CMakeFiles/swap_2.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/swap_2.dir/clean

test/CMakeFiles/swap_2.dir/depend:
	cd /home/kotone/dfa/eigen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kotone/dfa/eigen /home/kotone/dfa/eigen/test /home/kotone/dfa/eigen/build /home/kotone/dfa/eigen/build/test /home/kotone/dfa/eigen/build/test/CMakeFiles/swap_2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/swap_2.dir/depend

