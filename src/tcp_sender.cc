#include "tcp_sender.hh"
#include "tcp_config.hh"
#include <random>

using namespace std;

/* TCPSender constructor (uses a random ISN if none given) */
TCPSender::TCPSender( uint64_t initial_RTO_ms, optional<Wrap32> fixed_isn )
  : isn_( fixed_isn.value_or( Wrap32 { random_device()() } ) )
  , initial_RTO_ms_( initial_RTO_ms )
  , timer( initial_RTO_ms )
{}

uint64_t TCPSender::sequence_numbers_in_flight() const
{
  // Your code here.
  return next_seqno - ackno;
}

uint64_t TCPSender::consecutive_retransmissions() const
{
  // Your code here.
  return retransmit_package;
}

optional<TCPSenderMessage> TCPSender::maybe_send()
{
  // Your code here.

  if ( !SYN ) {
    return {};
  } else {
    if ( timer.get_state() == timer.RESEND ) {
      if(!outstand_queue.empty()) {
        TCPSenderMessage msg = outstand_queue.front();
        // TODO 是否需要判断 window_size != 0
        if(!ackno||window_size) timer.doubleRTO(); //window_size=0时，RTO重置为初始值。但由于syn未被确认时，window_size一直是0，这种情况需要doubleRTO。所以对 ackno取反，代表着syn还没被确认。
        else timer.reset();
        timer.open();

        return msg;
      }

    }
    if ( message_queue.empty() )
      return {};
    TCPSenderMessage msg = message_queue.front();
    outstand_queue.emplace( msg );
    message_queue.pop();
    if(timer.get_state() == timer.OFF) timer.open();
    return msg;
  }
}

void TCPSender::push( Reader& outbound_stream )
{
  // 1. 计算剩余空间
  // 2. 循环地尽量装满window,并减少剩余空间
  // 3. 直至没有剩余空间或stream无内容

  uint64_t remain_size = max( window_size, (uint64_t)1 ) - sequence_numbers_in_flight();
  while ( remain_size > 0 ) {
    TCPSenderMessage msg;
    read( outbound_stream, min( size_t( remain_size ), TCPConfig::MAX_PAYLOAD_SIZE ), msg.payload );
    remain_size -= msg.payload.size();
    msg.seqno = Wrap32::wrap( next_seqno, isn_ );
    if ( !SYN ) {
      SYN = true;
      msg.SYN = true;
      next_seqno++;
    }
    if ( !FIN && outbound_stream.is_finished() && remain_size) { //如果remain_size地方不够放了，就不要FIN
      FIN = true;
      msg.FIN = true;
      next_seqno++;
    }
    if ( !msg.SYN && !msg.FIN && msg.payload.size() == 0 )
      return;
    message_queue.emplace( msg );
    next_seqno += msg.payload.size();
  }
}

TCPSenderMessage TCPSender::send_empty_message() const
{
  TCPSenderMessage SenderMsg;

  SenderMsg.seqno = Wrap32::wrap( next_seqno, isn_ );
  return SenderMsg;
}

void TCPSender::receive( const TCPReceiverMessage& msg )
{
  // Your code here.
  size_t outstand_size = outstand_queue.size();
  window_size = msg.window_size;
  uint64_t tcp_ackno = msg.ackno->unwrap( isn_, ackno );
  if(tcp_ackno > next_seqno || tcp_ackno < ackno) return;
  while ( !outstand_queue.empty() ) {
    TCPSenderMessage outstand_msg = outstand_queue.front();
    uint64_t last_seq = outstand_msg.seqno.unwrap( isn_, tcp_ackno );
    if ( last_seq + outstand_msg.sequence_length() - 1 < tcp_ackno )
      outstand_queue.pop();
    else
      break;
  }
  if(outstand_queue.size() < outstand_size) { //当队列有元素被去除，代表确实有segment被接受了，那才要reset。
    timer.reset();
    timer.open();
  }
  retransmit_package = 0;
  if(outstand_queue.empty()) timer.close();

  ackno = tcp_ackno;
}

void TCPSender::tick( const size_t ms_since_last_tick )
{
  // Your code here.
  (void)ms_since_last_tick;

  timer.calculate_remain_alarm_time( ms_since_last_tick );
  if(timer.get_state() == timer.RESEND) retransmit_package++;
}
