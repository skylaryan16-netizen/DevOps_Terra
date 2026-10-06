terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}
resource "aws_instance" "my_instance" {
  ami           = "ami-06cfeaaa22092f09d"
  instance_type = "t3.micro"
  tags = {
    Name = "my_instance"
  }
}