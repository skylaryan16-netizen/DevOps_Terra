variable "region_ami_map" {
  type = map(string)
  default = {
    "us-east-1"      = "ami-0c55b159cbfafe1f0"
    "us-west-1"      = "ami-0bdb828fd58c52235"
    "eu-north-1"     = "ami-051c6296b8d2535f1"
  }
}

variable "Environment" {
  type = map(string)
  default = {
    "DEV"      = "us-east-1"
    "TESTING"      = "us-west-1"
    "PROD"     = "eu-north-1"
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "map-example" {
  region       = var.Environment["PROD"]
  ami           = var.region_ami_map["eu-north-1"]
  instance_type = "t3.micro"
  tags = {
    Name = "map-EC2-example"
  }
}

