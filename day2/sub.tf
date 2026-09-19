resource "aws_subnet" "pub_sub" {
  vpc_id  = aws_vpc.my_vpc.id
  cidr_block="192.168.5.0/25"
  tags = {
    Name = "pub_sub"
  }
}
resource "aws_subnet" "private_sub" {
  vpc_id  = aws_vpc.my_vpc.id
  cidr_block="192.168.5.128/25"
  tags = {
    Name = "private_sub"
  }
}