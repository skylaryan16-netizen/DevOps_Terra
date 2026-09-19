terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region  = "eu-north-1"
}
resource "aws_vpc" "my_vpc" {
  cidr_block="192.168.5.0/24"
  tags = {
    Name = "my_vpc"
  }
}
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
resource "aws_instance" "my_instance" {
  ami           = "ami-0b79f6b294a030f24"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.pub_sub.id
  tags = {
    Name = "my_instance"
  }
}