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

variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
  default     = ["AppServer", "DBServer", "CacheServer"]
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-06cfeaaa22092f09d"
  instance_type = "t3.micro"
  for_each     = toset(var.instance_names)

  tags = {
    Name = each.key
  }
}