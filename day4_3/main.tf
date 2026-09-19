terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}
variable "region" {
default="eu-north-1"
  
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.mydata.id
  instance_type = "t3.micro"
}

data "aws_ami" "mydata" {
  owners = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

output "instance_ip" {
  value = aws_instance.myec2.public_ip  
}
output "instance_private_ip" {
  value = aws_instance.myec2.private_ip  
}