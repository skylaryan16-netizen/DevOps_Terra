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

module "vpc" {
  source = "../mod"
}