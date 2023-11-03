#pragma once

#include "byte_stream.hh"
#include "tcp_receiver_message.hh"
#include "tcp_sender_message.hh"
#include <iostream>
class Timer
{
public:
  enum Timer_state
  {
    OFF = 0,
    ON,
    RESEND,

  };
private:
  int64_t RTO;
  uint64_t initial_RTO_ms_;
  int64_t remain_alarm_time;
  Timer_state state;
  int64_t time;
  int64_t start_time;

public:

  Timer( uint64_t rto_time )
    : RTO( rto_time )
    , initial_RTO_ms_( rto_time )
    , remain_alarm_time( rto_time )
    , state( Timer_state::OFF )
    , time( 0 )
    , start_time( 0 )
  {}

  void pass_time( uint64_t ms_since_last_tick ) { time += ms_since_last_tick; }
  // 每次tick时计算倒计时时间
  void calculate_remain_alarm_time( uint64_t ms_since_last_tick )
  {
    pass_time(ms_since_last_tick);
    remain_alarm_time = RTO - (time - start_time);
    if ( remain_alarm_time <= 0 ) {
      state = Timer_state::RESEND;
    }
  }

  void doubleRTO()
  {
    RTO = RTO * 2;
    remain_alarm_time = RTO;
  }

  void open()
  {
    state = Timer_state::ON;
    start_time = time;
  }

  void close(){
    state = Timer_state::OFF;
  }
  void reset(){
    RTO = initial_RTO_ms_;
  }

  Timer_state get_state() { return state; }
};

class TCPSender
{
  Wrap32 isn_;
  uint64_t initial_RTO_ms_;

  uint64_t ackno { 0 };
  uint64_t next_seqno { 0 };
  uint64_t window_size { 0 };
  uint64_t retransmit_package { 0 };
  bool SYN { false };
  bool FIN { false };
  std::queue<TCPSenderMessage> message_queue {};
  std::queue<TCPSenderMessage> outstand_queue {};
  Timer timer;

public:
  /* Construct TCP sender with given default Retransmission Timeout and possible ISN */
  TCPSender( uint64_t initial_RTO_ms, std::optional<Wrap32> fixed_isn );

  /* Push bytes from the outbound stream */
  void push( Reader& outbound_stream );

  /* Send a TCPSenderMessage if needed (or empty optional otherwise) */
  std::optional<TCPSenderMessage> maybe_send();

  /* Generate an empty TCPSenderMessage */
  TCPSenderMessage send_empty_message() const;

  /* Receive an act on a TCPReceiverMessage from the peer's receiver */
  void receive( const TCPReceiverMessage& msg );

  /* Time has passed by the given # of milliseconds since the last time the tick() method was called. */
  void tick( uint64_t ms_since_last_tick );

  /* Accessors for use in testing */
  uint64_t sequence_numbers_in_flight() const;  // How many sequence numbers are outstanding?
  uint64_t consecutive_retransmissions() const; // How many consecutive *re*transmissions have happened?
};
