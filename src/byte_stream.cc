#include <stdexcept>
#include "iostream"
#include "byte_stream.hh"

using namespace std;

ByteStream::ByteStream( uint64_t capacity ) : capacity_( capacity ) {}

void Writer::push( string data )
{
  // Your code here.
  size_t data_size = min(available_capacity(),data.size());
  buffer_.append(data.substr(0,data_size));
  write_count += data_size;
}

void Writer::close()
{
  // Your code here.
    closed_ = true;
}

void Writer::set_error()
{
  // Your code here.
  error_ = true;
}

bool Writer::is_closed() const
{
  // Your code here.
  return closed_;
}

uint64_t Writer::available_capacity() const
{
  // Your code here.
  return capacity_ - buffer_.length();
}
uint64_t Writer::get_capacity() const
{
  return capacity_;
}
uint64_t Writer::bytes_pushed() const
{
  // Your code here.
  return write_count;
}

string_view Reader::peek() const
{
  // Your code here.
  return string_view{&buffer_[0],buffer_.length()};
}

bool Reader::is_finished() const
{
  // Your code here.
  return closed_ && buffer_.empty();
}

bool Reader::has_error() const
{
  // Your code here.
  return error_;
}

void Reader::pop( uint64_t len )
{
  // Your code here.
  (void)len;
  size_t elen = len > buffer_.length() ? buffer_.length() : len;
  buffer_.erase(0,elen);
  read_count += elen;
}

uint64_t Reader::bytes_buffered() const
{
  // Your code here.
  return buffer_.length();

}

uint64_t Reader::bytes_popped() const
{
  // Your code here.
  return read_count;
}