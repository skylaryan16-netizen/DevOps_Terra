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
  ami           = "ami-051c6296b8d2535f1"
  instance_type = var.instype[var.choice]
  tags = {
    Name = "my_instance"
  }
}
variable "instype" {
  description = "Instance type for the EC2 instance"
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.medium"]
  
}
variable "choice" {
  description = "enter the value (0 for t3.micro, 1 for t3.small, 2 for t3.medium)"
  type        = number
  
}