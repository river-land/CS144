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

# Utility rule file for format.

# Include any custom commands dependencies for this target.
include CMakeFiles/format.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/format.dir/progress.make

CMakeFiles/format:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Formatting source code..."
	clang-format -i /home/yjl/nuaa/projects/cpp/CS144/CS144/apps/bidirectional_stream_copy.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/apps/bidirectional_stream_copy.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/apps/endtoend.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/apps/iptest.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/apps/tcp_ipv4.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/apps/tcp_native.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/apps/webget.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/byte_stream.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/byte_stream.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/src/byte_stream_helpers.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/network_interface.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/network_interface.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/src/reassembler.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/reassembler.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/src/router.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/router.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/src/tcp_receiver.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/tcp_receiver.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/src/tcp_sender.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/tcp_sender.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/src/wrapping_integers.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/src/wrapping_integers.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/byte_stream_basics.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/byte_stream_capacity.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/byte_stream_many_writes.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/byte_stream_one_write.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/byte_stream_speed_test.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/byte_stream_stress_test.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/byte_stream_test_harness.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/byte_stream_two_writes.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/common.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/common.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/conversions.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/net_interface.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/network_interface_test_harness.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_cap.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_dup.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_holes.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_overlapping.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_seq.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_single.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_speed_test.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_test_harness.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/reassembler_win.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/receiver_test_harness.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_close.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_connect.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_reorder.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_reorder_more.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_special.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_transmit.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/recv_window.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/router.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/send_ack.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/send_close.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/send_connect.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/send_extra.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/send_retx.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/send_transmit.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/send_window.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/sender_test_harness.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/test_should_be.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/wrapping_integers_cmp.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/wrapping_integers_extra.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/wrapping_integers_roundtrip.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/wrapping_integers_unwrap.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/tests/wrapping_integers_wrap.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/address.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/address.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/arp_message.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/arp_message.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/buffer.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/checksum.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/ethernet_frame.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/ethernet_header.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/ethernet_header.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/eventloop.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/eventloop.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/exception.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/fd_adapter.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/file_descriptor.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/file_descriptor.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/ipv4_datagram.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/ipv4_header.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/ipv4_header.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/lossy_fd_adapter.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/parser.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/random.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/random.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/socket.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/socket.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_config.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_minnow_socket.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_minnow_socket.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_over_ip.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_over_ip.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_peer.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_receiver_message.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_segment.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_segment.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tcp_sender_message.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tun.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tun.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tuntap_adapter.cc /home/yjl/nuaa/projects/cpp/CS144/CS144/util/tuntap_adapter.hh /home/yjl/nuaa/projects/cpp/CS144/CS144/util/udinfo.hh

format: CMakeFiles/format
format: CMakeFiles/format.dir/build.make
.PHONY : format

# Rule to build all files generated by this target.
CMakeFiles/format.dir/build: format
.PHONY : CMakeFiles/format.dir/build

CMakeFiles/format.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/format.dir/cmake_clean.cmake
.PHONY : CMakeFiles/format.dir/clean

CMakeFiles/format.dir/depend:
	cd /home/yjl/nuaa/projects/cpp/CS144/CS144/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yjl/nuaa/projects/cpp/CS144/CS144 /home/yjl/nuaa/projects/cpp/CS144/CS144 /home/yjl/nuaa/projects/cpp/CS144/CS144/build /home/yjl/nuaa/projects/cpp/CS144/CS144/build /home/yjl/nuaa/projects/cpp/CS144/CS144/build/CMakeFiles/format.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/format.dir/depend

