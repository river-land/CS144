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
include tests/CMakeFiles/router.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/router.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/router.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/router.dir/flags.make

tests/CMakeFiles/router.dir/router.cc.o: tests/CMakeFiles/router.dir/flags.make
tests/CMakeFiles/router.dir/router.cc.o: /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/router.cc
tests/CMakeFiles/router.dir/router.cc.o: tests/CMakeFiles/router.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/router.dir/router.cc.o"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/router.dir/router.cc.o -MF CMakeFiles/router.dir/router.cc.o.d -o CMakeFiles/router.dir/router.cc.o -c /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/router.cc

tests/CMakeFiles/router.dir/router.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/router.dir/router.cc.i"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/router.cc > CMakeFiles/router.dir/router.cc.i

tests/CMakeFiles/router.dir/router.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/router.dir/router.cc.s"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/router.cc -o CMakeFiles/router.dir/router.cc.s

# Object files for target router
router_OBJECTS = \
"CMakeFiles/router.dir/router.cc.o"

# External object files for target router
router_EXTERNAL_OBJECTS =

tests/router: tests/CMakeFiles/router.dir/router.cc.o
tests/router: tests/CMakeFiles/router.dir/build.make
tests/router: tests/libminnow_testing_debug.a
tests/router: src/libminnow_debug.a
tests/router: util/libutil_debug.a
tests/router: tests/CMakeFiles/router.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable router"
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/router.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/router.dir/build: tests/router
.PHONY : tests/CMakeFiles/router.dir/build

tests/CMakeFiles/router.dir/clean:
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/router.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/router.dir/clean

tests/CMakeFiles/router.dir/depend:
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yjl/nuaa/projects/cpp/CS144/CS144 /home/yjl/nuaa/projects/cpp/CS144/CS144/tests /home/yjl/nuaa/projects/cpp/CS144/CS144/build /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests /home/yjl/nuaa/projects/cpp/CS144/CS144/build/tests/CMakeFiles/router.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/router.dir/depend

