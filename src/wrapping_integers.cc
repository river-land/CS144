#include "wrapping_integers.hh"
#include <cmath>
using namespace std;

Wrap32 Wrap32::wrap( uint64_t n, Wrap32 zero_point )
{
  // Your code here.
  (void)n;
  (void)zero_point;
  return Wrap32 { zero_point + static_cast<uint32_t>( n ) };
}

uint64_t Wrap32::unwrap( Wrap32 zero_point, uint64_t checkpoint ) const
{
  // Your code here.
  // 当前seqno相对于检查点之间的偏移
  uint32_t offset = this->raw_value_ - wrap( checkpoint, zero_point ).raw_value_;
  uint64_t res = checkpoint + offset;
  /*
    如果offset大于1<<32的一半，则离checkpoint更近的应该是checkpoint前面的元素 res向前一段(1<<32)；
    需要注意的是如果res小于1<<32，则不能向前。
  */
  if ( offset >= ( 1U << 31 ) && res >= 1UL << 32 ) {
    res -= ( 1UL << 32 );
  }
  return res;
}
