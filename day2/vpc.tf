resource "aws_vpc" "my_vpc" {
  cidr_block="192.168.5.0/24"
  tags = {
    Name = "my_vpc"
  }
}