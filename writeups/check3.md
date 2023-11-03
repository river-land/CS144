1. 回收 receiver 的 窗口大小和ackno
2. 尽可能地从bytestream读取数据，并去填满窗口，有必要地发送SYN和FIN

- outbound_stream 没有数据时，直接 return
- while 循环生成 segment ，加入 queue，因为每个 segment 最大不能超过 TCPConfig::MAXSIZE
- window_size = 0 时，要设为1，具体看文档

3. seqno_flight
- 是指从 stream 取出来的 bytes(即使还没有发送也算) 但还未收到 ack
4. 跟踪已发送，但未获取ackno的包，必要时超时重传
5. Timer
- tick 函数每次被调用，给你一个距离上次tick被调用的实参
- TCPSender 初始化时，给你一个初始 RTO 值。
- 构建一个 Timer 类，用于计时 segment 发送之后的时间，防止超时。
- 如果 tick 被调用，并且超时重传器已经超时:
    1. 重传第一个还没完全被ack的segment，**为了实现重传，需要保存一下已发送segment的备份**
    2. 如果 window_size != 0
        1. 记录针对某个段的连续重传次数，TCPConnection用它来决定本次连接是否应该断开
        2. double RTO
    3. 重置 timer 并启动它。
- 接收方发送 ackno ，且此 ackno 都大于此前的 ackno:
    1. 重置 RTO 为初始值
    2. 如果发送方还有未 ack 的 segment，重启 timer。
    3. 重置连续重传次数为 0