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
  type = map(object({
    name          = string
    instance_type = string
  }))

  default = {
    app_server = {
      name          = "AppServer"
      instance_type = "t3.micro"
    }
    db_server = {
      name          = "DBServer"
      instance_type = "t3.medium"
    }
    cache_server = {
      name          = "CacheServer"
      instance_type = "c4.large"
    }
  }
}

# For loop for creating isstances
resource "aws_instance" "my_ec2" {
  ami           = "ami-06cfeaaa22092f09d"
  instance_type = each.value.instance_type
  for_each      = var.instance_names

  tags = {
    Name = each.value.name
  }
}