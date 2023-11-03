#include "tcp_receiver.hh"
#include "iostream"
using namespace std;

void TCPReceiver::update_ackno( uint64_t next_index,Writer& inbound_stream)
{
  uint64_t abs_ackno = next_index + syn_set;
  if(fin_set && inbound_stream.is_closed()) ++abs_ackno;  //syn 和 fin 包也算一个字节，ackno也要加上他们
  ackno = Wrap32::wrap(abs_ackno , isn );
}

void TCPReceiver::receive( TCPSenderMessage message, Reassembler& reassembler, Writer& inbound_stream )
{
  if ( message.SYN ) {  //如果发现这是一个syn包，把isn号取出来存放
    syn_set = true;
    isn = message.seqno;
  }
  if(message.FIN) fin_set = true;
  if ( !syn_set ) //如果上面syn_set没有被设置为true，代表到现在syn包还没获取，直接丢弃
    return;
  tcp_reassembler = reassembler;

  uint64_t first_index = message.seqno.unwrap( isn, reassembler.get_next_index() ); // 获取当前包的abs_seqno
  reassembler.insert( first_index + message.SYN - 1, message.payload, message.FIN, inbound_stream ); //当前包的first_index应该要减一，详情见check2的索引转换关系，但如果当前包是syn包，要加1，否则如果这个包只是syn但没有payload，会因为-1导致 syn(0)-1 = -1(first_index)
  update_ackno( reassembler.get_next_index(),inbound_stream);
}

TCPReceiverMessage TCPReceiver::send( const Writer& inbound_stream ) const
{
  TCPReceiverMessage back_msg;
  uint64_t ws = inbound_stream.available_capacity();
  back_msg.window_size = ws > 65535 ? 65535 : ws; //避免测试用例给的过大cap，导致溢出
  if ( !syn_set )
    back_msg.ackno = nullopt; // std::optional 可选值，默认空位nullopt
  else
    back_msg.ackno = ackno;
  return back_msg;
}

