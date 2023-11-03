#include "network_interface.hh"

#include "arp_message.hh"
#include "ethernet_frame.hh"

using namespace std;

// ethernet_address: Ethernet (what ARP calls "hardware") address of the interface
// ip_address: IP (what ARP calls "protocol") address of the interface
NetworkInterface::NetworkInterface( const EthernetAddress& ethernet_address, const Address& ip_address )
  : ethernet_address_( ethernet_address ), ip_address_( ip_address )
{
  cerr << "DEBUG: Network interface has Ethernet address " << to_string( ethernet_address_ ) << " and IP address "
       << ip_address.ip() << "\n";
}

// dgram: the IPv4 datagram to be sent
// next_hop: the IP address of the interface to send it to (typically a router or default gateway, but
// may also be another host if directly connected to the same network as the destination)

// Note: the Address type can be converted to a uint32_t (raw 32-bit IP address) by using the
// Address::ipv4_numeric() method.
void NetworkInterface::send_datagram( const InternetDatagram& dgram, const Address& next_hop )
{
  (void)dgram;
  (void)next_hop;
  EthernetFrame ARP_EthFm {}; // 创建空的ARP消息以太网帧
  EthernetHeader ARPEthFmheader {};
  // 1. 无地址映射，构建ARP消息准备发送
  if ( !send_ARP_in_five_secs && AddressMapping.find( next_hop ) == AddressMapping.end() ) {
    // 构建ARP以太网帧头
    ARPEthFmheader.src = ethernet_address_;
    ARPEthFmheader.dst = ETHERNET_BROADCAST;
    ARPEthFmheader.type = EthernetHeader::TYPE_ARP;

    // 构建ARP消息
    ARPMessage ARPmsg {};
    ARPmsg.opcode = ARPMessage::OPCODE_REQUEST;
    ARPmsg.sender_ethernet_address = ethernet_address_;
    ARPmsg.sender_ip_address = ip_address_.ipv4_numeric();
    ARPmsg.target_ip_address = next_hop.ipv4_numeric();

    ARP_EthFm.payload = std::move( serialize( ARPmsg ) ); // TODO 不是放IP包内容，而是放ARPMsg
    ARP_EthFm.header = ARPEthFmheader;
    EthernetQueue.emplace( ARP_EthFm );
    send_ARP_in_five_secs = 1;
    send_ARP_time = real_time;

    // 保存副本
    InternetDatagramQueue.emplace( pair<InternetDatagram, Address>( dgram, next_hop ) );

  } else if(AddressMapping.find(next_hop) != AddressMapping.end()){ // 2. 有地址映射，构建IPv4消息准备发送
    // 构建IPv4 以太网帧头
    EthernetFrame IPv4_EthFm {};
    EthernetHeader IPv4_EthFmheader {};
    IPv4_EthFmheader.src = ethernet_address_;
    IPv4_EthFmheader.dst = AddressMapping[next_hop].first;
    IPv4_EthFmheader.type = ARPEthFmheader.TYPE_IPv4;

    // 构建IPv4消息
    IPv4_EthFm.payload = std::move( serialize( dgram ) );
    IPv4_EthFm.header = IPv4_EthFmheader;
    EthernetQueue.emplace( IPv4_EthFm );
  }
}

// frame: the incoming Ethernet frame
optional<InternetDatagram> NetworkInterface::recv_frame( const EthernetFrame& frame )
{
  EthernetAddress dst = frame.header.dst;
  if ( dst != ETHERNET_BROADCAST && dst != ethernet_address_ ) // 如果硬件目的地址不是本设备或广播地址，则拒绝接收
    return nullopt;

  InternetDatagram internetDm {};
  if ( frame.header.type == EthernetHeader::TYPE_IPv4 ) { // 如果接收IP包，解析成InternetDatagram包返回
    if ( parse( internetDm, frame.payload ) )
      return internetDm;
    else
      return nullopt;
  }
  if ( frame.header.type
       == EthernetHeader::TYPE_ARP ) { // 如果接收到ARP包，判断目的ip是否是本机，如果是则处理request和reply的情况
    ARPMessage ARPmsg {};
    parse( ARPmsg, frame.payload );
    if ( ARPmsg.target_ip_address != ip_address_.ipv4_numeric() )
      return nullopt;

    if ( parse( ARPmsg, frame.payload ) ) {
      AddressMapping[Address::from_ipv4_numeric( ARPmsg.sender_ip_address )]
        = pair<EthernetAddress, int32_t>( ARPmsg.sender_ethernet_address, initial_TTL );
      if ( ARPmsg.opcode == ARPMessage::OPCODE_REPLY ) {
        send_datagram( InternetDatagramQueue.front().first, InternetDatagramQueue.front().second );
        InternetDatagramQueue.pop();
      } else { // 是ARP请求，咱得回复一个ARP。
        EthernetFrame ARP_EthFm {};
        EthernetHeader ARPEthFmheader {};

        ARPEthFmheader.dst = ARPmsg.sender_ethernet_address;
        ARPEthFmheader.src = ethernet_address_;
        ARPEthFmheader.type = EthernetHeader::TYPE_ARP;

        ARPMessage REPLY {};
        REPLY.opcode = ARPMessage::OPCODE_REPLY;
        REPLY.sender_ethernet_address = ethernet_address_;
        REPLY.sender_ip_address = ip_address_.ipv4_numeric();
        REPLY.target_ethernet_address = ARPmsg.sender_ethernet_address;
        REPLY.target_ip_address = ARPmsg.sender_ip_address;

        ARP_EthFm.payload = std::move( serialize( REPLY ) );
        ARP_EthFm.header = ARPEthFmheader;
        EthernetQueue.emplace( ARP_EthFm );
      }

      return nullopt;
    }
  }
  return nullopt;
}

// ms_since_last_tick: the number of milliseconds since the last call to this method
void NetworkInterface::tick( const size_t ms_since_last_tick )
{
  real_time += ms_since_last_tick;
  if(real_time - send_ARP_time >= 5000) send_ARP_in_five_secs = 0;
  for ( auto it = AddressMapping.begin(); it != AddressMapping.end();) {
    int32_t& remaining_TTL = it->second.second;
    remaining_TTL -= ms_since_last_tick;
    if(remaining_TTL <= 0) it = AddressMapping.erase(it);
    else it++;
  }
}

optional<EthernetFrame> NetworkInterface::maybe_send()
{
  if ( EthernetQueue.empty() )
    return {};
  EthernetFrame EthFm = EthernetQueue.front();
  EthernetQueue.pop();
  return EthFm;
}
