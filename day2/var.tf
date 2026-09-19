variable "cidr_vpc" {
    description = "CIDR block for the VPC"
    default = "192.168.6.128/25"
  
}
variable "cidr_pub_sub" {
  description = "CIDR block for the public subnet"
  default = "192.168.6.0/25"
}
variable "cidr_private_sub" {
  description = "CIDR block for the private subnet"
  default = "192.168.6.0/24"
}