# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yjl/nuaa/projects/cpp/CS144/CS144

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yjl/nuaa/projects/cpp/CS144/CS144/build

# Utility rule file for tidy_util__socket.cc.

# Include any custom commands dependencies for this target.
include CMakeFiles/tidy_util__socket.cc.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/tidy_util__socket.cc.dir/progress.make

CMakeFiles/tidy_util__socket.cc:
	clang-tidy --quiet -header-filter=.* -p=/home/yjl/nuaa/projects/cpp/CS144/CS144/build /home/yjl/nuaa/projects/cpp/CS144/CS144/util/socket.cc

tidy_util__socket.cc: CMakeFiles/tidy_util__socket.cc
tidy_util__socket.cc: CMakeFiles/tidy_util__socket.cc.dir/build.make
.PHONY : tidy_util__socket.cc

# Rule to build all files generated by this target.
CMakeFiles/tidy_util__socket.cc.dir/build: tidy_util__socket.cc
.PHONY : CMakeFiles/tidy_util__socket.cc.dir/build

CMakeFiles/tidy_util__socket.cc.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tidy_util__socket.cc.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tidy_util__socket.cc.dir/clean

CMakeFiles/tidy_util__socket.cc.dir/depend:
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yjl/nuaa/projects/cpp/CS144/CS144 /home/yjl/nuaa/projects/cpp/CS144/CS144 /home/yjl/nuaa/projects/cpp/CS144/CS144/build /home/yjl/nuaa/projects/cpp/CS144/CS144/build /home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles/tidy_util__socket.cc.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/tidy_util__socket.cc.dir/depend
