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

# Utility rule file for doc.

# Include the progress variables for this target.
include doc/CMakeFiles/doc.dir/progress.make

doc/CMakeFiles/doc:
	cd /home/kotone/dfa/eigen/build/doc && doxygen
	cd /home/kotone/dfa/eigen/build/doc && doxygen Doxyfile-unsupported
	cd /home/kotone/dfa/eigen/build/doc && /home/kotone/bin/cmake -E copy /home/kotone/dfa/eigen/build/doc/html/group__TopicUnalignedArrayAssert.html /home/kotone/dfa/eigen/build/doc/html/TopicUnalignedArrayAssert.html
	cd /home/kotone/dfa/eigen/build/doc && /home/kotone/bin/cmake -E rename html eigen-doc
	cd /home/kotone/dfa/eigen/build/doc && /home/kotone/bin/cmake -E remove eigen-doc/eigen-doc.tgz
	cd /home/kotone/dfa/eigen/build/doc && /home/kotone/bin/cmake -E tar cfz eigen-doc.tgz eigen-doc
	cd /home/kotone/dfa/eigen/build/doc && /home/kotone/bin/cmake -E rename eigen-doc.tgz eigen-doc/eigen-doc.tgz
	cd /home/kotone/dfa/eigen/build/doc && /home/kotone/bin/cmake -E rename eigen-doc html

doc: doc/CMakeFiles/doc
doc: doc/CMakeFiles/doc.dir/build.make

.PHONY : doc

# Rule to build all files generated by this target.
doc/CMakeFiles/doc.dir/build: doc

.PHONY : doc/CMakeFiles/doc.dir/build

doc/CMakeFiles/doc.dir/clean:
	cd /home/kotone/dfa/eigen/build/doc && $(CMAKE_COMMAND) -P CMakeFiles/doc.dir/cmake_clean.cmake
.PHONY : doc/CMakeFiles/doc.dir/clean

doc/CMakeFiles/doc.dir/depend:
	cd /home/kotone/dfa/eigen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kotone/dfa/eigen /home/kotone/dfa/eigen/doc /home/kotone/dfa/eigen/build /home/kotone/dfa/eigen/build/doc /home/kotone/dfa/eigen/build/doc/CMakeFiles/doc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/CMakeFiles/doc.dir/depend

