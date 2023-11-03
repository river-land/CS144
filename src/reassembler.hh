#pragma once

#include "byte_stream.hh"

#include <set>
#include <string>
class Reassembler
{
private:
  typedef struct bytes
  {
    size_t first_index = 0; //每个包的first_index
    std::string data = {};//每个包的数据
    size_t length = 0;//每个包的长度
    bool operator<( const bytes& rhs ) const {
      return first_index < rhs.first_index; //保证set排序是以first_index升序
    }
  } bytes_node;

  std::set<bytes> buffer {};//重组器缓存

  size_t next_index = 0;//已pop的下一位，即接下来byte_stream要接受的位
  size_t last_index = INT64_MAX;//记录程序运行时得知的最后一位的位数
  size_t all_cap = 0;//byte_stream+重组器共有的容量

public:
  /*
   * Insert a new substring to be reassembled into a ByteStream.
   *   `first_index`: the index of the first byte of the substring
   *   `data`: the substring itself
   *   `is_last_substring`: this substring represents the end of the stream
   *   `output`: a mutable reference to the Writer
   *
   * The Reassembler's job is to reassemble the indexed substrings (possibly out-of-order
   * and possibly overlapping) back into the original ByteStream. As soon as the Reassembler
   * learns the next byte in the stream, it should write it to the output.
   *
   * If the Reassembler learns about bytes that fit within the stream's available capacity
   * but can't yet be written (because earlier bytes remain unknown), it should store them
   * internally until the gaps are filled in.
   *
   * The Reassembler should discard any bytes that lie beyond the stream's available capacity
   * (i.e., bytes that couldn't be written even if earlier gaps get filled in).
   *
   * The Reassembler should close the stream after writing the last byte.
   */
  void insert( uint64_t first_index, std::string data, bool is_last_substring, Writer& output );

  // How many bytes are stored in the Reassembler itself?
  uint64_t bytes_pending() const;

  std::string merge( bytes_node& bn,Writer& output);//当前包的first_index符合next_index时，将当前包与重组器缓存中的包尝试连接

  void add_element(bytes_node& bn);//添加当前包，考虑到：1.当前包被覆盖需要舍弃 2.当前包覆盖缓存中的包需要替代
  uint64_t get_next_index()const;
};