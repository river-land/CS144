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
include tests/CMakeFiles/reassembler_win.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/reassembler_win.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/reassembler_win.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/reassembler_win.dir/flags.make

tests/CMakeFiles/reassembler_win.dir/reassembler_win.cc.o: tests/CMakeFiles/reassembler_win.dir/flags.make
tests/CMakeFiles/reassembler_win.dir/reassembler_win.cc.o: /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_win.cc
tests/CMakeFiles/reassembler_win.dir/reassembler_win.cc.o: tests/CMakeFiles/reassembler_win.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/reassembler_win.dir/reassembler_win.cc.o"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/reassembler_win.dir/reassembler_win.cc.o -MF CMakeFiles/reassembler_win.dir/reassembler_win.cc.o.d -o CMakeFiles/reassembler_win.dir/reassembler_win.cc.o -c /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_win.cc

tests/CMakeFiles/reassembler_win.dir/reassembler_win.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/reassembler_win.dir/reassembler_win.cc.i"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_win.cc > CMakeFiles/reassembler_win.dir/reassembler_win.cc.i

tests/CMakeFiles/reassembler_win.dir/reassembler_win.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/reassembler_win.dir/reassembler_win.cc.s"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_win.cc -o CMakeFiles/reassembler_win.dir/reassembler_win.cc.s

# Object files for target reassembler_win
reassembler_win_OBJECTS = \
"CMakeFiles/reassembler_win.dir/reassembler_win.cc.o"

# External object files for target reassembler_win
reassembler_win_EXTERNAL_OBJECTS =

tests/reassembler_win: tests/CMakeFiles/reassembler_win.dir/reassembler_win.cc.o
tests/reassembler_win: tests/CMakeFiles/reassembler_win.dir/build.make
tests/reassembler_win: tests/libminnow_testing_debug.a
tests/reassembler_win: src/libminnow_debug.a
tests/reassembler_win: util/libutil_debug.a
tests/reassembler_win: tests/CMakeFiles/reassembler_win.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable reassembler_win"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/reassembler_win.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/reassembler_win.dir/build: tests/reassembler_win
.PHONY : tests/CMakeFiles/reassembler_win.dir/build

tests/CMakeFiles/reassembler_win.dir/clean:
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/reassembler_win.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/reassembler_win.dir/clean

tests/CMakeFiles/reassembler_win.dir/depend:
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yjl/nuaa/projects/cpp/CS144/CS144 /home/yjl/nuaa/projects/cpp/CS144/CS144/tests /home/yjl/nuaa/projects/cpp/CS144/CS144/build /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests/CMakeFiles/reassembler_win.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/reassembler_win.dir/depend

