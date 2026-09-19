variable "instype" {
  type = map(string)
  default = {
    "prod"      = "t2.micro"
    "dev"      = "t3.micro"
    "sit"      = "t3.small"
     }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "map-example" {
  ami           = "ami-051c6296b8d2535f1"
  instance_type = var.instype[var.choice]
  tags = {
    Name = "map-EC2-example"
  }
}
variable "choice" {
  description = "enter the value (prod, dev, sit)"
  type        = string
}