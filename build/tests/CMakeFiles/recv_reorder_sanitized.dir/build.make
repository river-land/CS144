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

# Include any dependencies generated for this target.
include tests/CMakeFiles/recv_reorder_sanitized.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/recv_reorder_sanitized.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/recv_reorder_sanitized.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/recv_reorder_sanitized.dir/flags.make

tests/CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o: tests/CMakeFiles/recv_reorder_sanitized.dir/flags.make
tests/CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o: /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_reorder.cc
tests/CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o: tests/CMakeFiles/recv_reorder_sanitized.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o -MF CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o.d -o CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o -c /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_reorder.cc

tests/CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.i"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_reorder.cc > CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.i

tests/CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.s"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_reorder.cc -o CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.s

# Object files for target recv_reorder_sanitized
recv_reorder_sanitized_OBJECTS = \
"CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o"

# External object files for target recv_reorder_sanitized
recv_reorder_sanitized_EXTERNAL_OBJECTS =

tests/recv_reorder_sanitized: tests/CMakeFiles/recv_reorder_sanitized.dir/recv_reorder.cc.o
tests/recv_reorder_sanitized: tests/CMakeFiles/recv_reorder_sanitized.dir/build.make
tests/recv_reorder_sanitized: tests/libminnow_testing_sanitized.a
tests/recv_reorder_sanitized: src/libminnow_sanitized.a
tests/recv_reorder_sanitized: util/libutil_sanitized.a
tests/recv_reorder_sanitized: tests/CMakeFiles/recv_reorder_sanitized.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable recv_reorder_sanitized"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/recv_reorder_sanitized.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/recv_reorder_sanitized.dir/build: tests/recv_reorder_sanitized
.PHONY : tests/CMakeFiles/recv_reorder_sanitized.dir/build

tests/CMakeFiles/recv_reorder_sanitized.dir/clean:
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/recv_reorder_sanitized.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/recv_reorder_sanitized.dir/clean

tests/CMakeFiles/recv_reorder_sanitized.dir/depend:
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yjl/nuaa/projects/cpp/CS144/CS144 /home/yjl/nuaa/projects/cpp/CS144/CS144/tests /home/yjl/nuaa/projects/cpp/CS144/CS144/build /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests/CMakeFiles/recv_reorder_sanitized.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/recv_reorder_sanitized.dir/depend

