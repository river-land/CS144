#include "reassembler.hh"
#include <iostream>
using namespace std;

void Reassembler::add_element( bytes_node& bn )
{
  for ( auto it = buffer.begin(); it != buffer.end(); ) {
    auto thisbn = *it;
    size_t thisbn_last_index = thisbn.first_index + thisbn.data.size() - 1;
    size_t bn_last_index = bn.first_index + bn.data.size() - 1;
    if ( thisbn.first_index <= bn.first_index && thisbn_last_index >= bn_last_index )
      return;

    if ( thisbn.first_index >= bn.first_index
         && thisbn_last_index <= bn_last_index ) { // bn 吞噬 当前bn，需要insert bn
      it = buffer.erase( it );
      continue;
    }
    if ( thisbn_last_index < bn.first_index || bn_last_index < thisbn.first_index ) {
      it++;
      continue;
    }
    // 左拼接 需要Insert bn
    if ( thisbn.first_index < bn.first_index && thisbn_last_index <= bn_last_index ) {
      bytes_node newbn {};
      newbn.first_index = thisbn.first_index;
      newbn.data = thisbn.data + bn.data.substr( thisbn_last_index - bn.first_index + 1 );
      newbn.length = newbn.data.size();
      bn = newbn;
      it = buffer.erase( it );
    }
    // 右拼接 需要insert bn
    bn_last_index = bn.first_index + bn.data.size() - 1;
    if ( thisbn.first_index > bn.first_index && thisbn_last_index > bn_last_index ) {
      bytes_node newbn {};
      newbn.first_index = bn.first_index;
      newbn.data = bn.data + thisbn.data.substr( bn_last_index - thisbn.first_index + 1 );
      newbn.length = newbn.data.size();
      bn = newbn;
      it = buffer.erase( it );
    }
  }
  buffer.insert( bn );
}

std::string Reassembler::merge( bytes_node& bn, Writer& output )
{
  uint64_t m_index = next_index;
  std::string this_data = bn.data.substr( next_index - bn.first_index, output.available_capacity() );
  m_index += this_data.size(); // 首先将当前包的数据加上
  if ( !buffer.empty() ) {
    for ( std::set<bytes_node>::iterator it = buffer.begin();
          it != buffer.end(); ) { // 循环重组器缓冲中的网络包，一直尝试拼接直到中间断开
      bytes_node iter_bn = *it;
      if ( output.available_capacity() == 0
           || iter_bn.first_index > m_index ) { // 1.没容量继续放set之后的包了 2.set后面的接不上
        break;
      }
      if ( iter_bn.first_index + iter_bn.data.size() - 1 < m_index ) { // set后面的已经被覆盖了，直接跳过
        it = buffer.erase( it );
        continue;
      }
      std::string tmp_data = iter_bn.data.substr(
        m_index - iter_bn.first_index, output.available_capacity() ); // 将set中的包切割好与前一个包拼接好
      m_index += tmp_data.size();
      this_data += tmp_data;
      it = buffer.erase( it );
    }
  } else {
    return this_data;
  }

  return this_data;
}

void Reassembler::insert( uint64_t first_index, string data, bool is_last_substring, Writer& output )
{
  all_cap = output.get_capacity();
  if ( bytes_pending() + output.reader().bytes_buffered() >= all_cap )
    return;

  if ( is_last_substring ) {
    last_index
      = first_index + data.size()
        - 1; // 记录最后一位，因为is_last_substring不代表insert动作后面不会有，后面可能还会有，此时就需要先记录。
  }

  bytes_node bn;
  bn.first_index = first_index;
  bn.data = data;
  bn.length = data.size();
  std::string push_data;
  uint64_t max_idx
    = output.reader().bytes_popped() + output.reader().bytes_buffered() + output.available_capacity();
  // data.size() <= all_cap - output.reader().bytes_buffered()-output.reader().bytes_popped()
  //   - bytes_pending()
  if ( next_index >= first_index
       && next_index
            < first_index
                + data.size() ) { // 如果当前包覆盖范围，包含了next_index，说明当前包是我们需要的，于是尝试拼接
    push_data = merge( bn, output );
    output.push( push_data );
    next_index += push_data.size();
  } else if ( next_index < first_index
              && first_index < max_idx ) { // 如果当前包的位大于next_index且缓存有容量，则放进缓存，这里的max_idx需要再看一下 //TODO

    bytes_node newbn {};
    newbn.first_index = bn.first_index;
    newbn.data = bn.data.substr( 0, all_cap - bn.first_index );
    newbn.length = newbn.data.size();
    add_element( newbn );
  }

  if ( next_index == last_index + 1 )
    output.close();
}

uint64_t Reassembler::bytes_pending() const
{
  // Your code here.
  size_t bytes_count = 0;
  for ( auto it : buffer ) {
    bytes_count += it.length;
  }
  return bytes_count;
}

uint64_t Reassembler::get_next_index() const
{
  return next_index;
}