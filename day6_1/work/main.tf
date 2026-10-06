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

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
    tags = {
        Name = "main-vpc"
    }
}

terraform {
  backend "s3" {
    bucket = "akash-b1"
    key    = "day6_1/terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "akash-t1"
    #use_locking = true  --> this we can use if dynamodb table is not used for locking
    #or
    #use_lockfile = true  --> this we can use if dynamodb table is not used for locking
  }
}