variable "region_ami_map" {
  type = map(string)
  default = {
    "us-east-1"      = "ami-0c55b159cbfafe1f0"
    "us-west-1"      = "ami-0bdb828fd58c52235"
    "us-west-2"      = "ami-08962a4068733a2b6"
    "eu-central-1"   = "ami-0233214e13e500f77"
    "eu-north-1"     = "ami-051c6296b8d2535f1"
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "map-example" {
  ami           = var.region_ami_map["eu-north-1"]
  instance_type = "t3.micro"
  tags = {
    Name = "map-EC2-example"
  }
}