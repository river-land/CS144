#pragma once

#include "reassembler.hh"
#include "tcp_receiver_message.hh"
#include "tcp_sender_message.hh"

class TCPReceiver
{
public:
  /*
   * The TCPReceiver receives TCPSenderMessages, inserting their payload into the Reassembler
   * at the correct stream index.
   */
  void receive( TCPSenderMessage message, Reassembler& reassembler, Writer& inbound_stream );

  /* The TCPReceiver sends TCPReceiverMessages back to the TCPSender. */
  TCPReceiverMessage send( const Writer& inbound_stream ) const;
  void update_ackno(uint64_t next_index,Writer& inbound_stream);

  Reassembler tcp_reassembler;

  bool syn_set = false;
  bool fin_set = false;
  Wrap32 ackno = Wrap32(0);
  Wrap32 isn = Wrap32(0);

};
