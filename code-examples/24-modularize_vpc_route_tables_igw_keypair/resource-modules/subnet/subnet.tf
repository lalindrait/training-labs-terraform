variable "vpc_id" {}
variable "cidr_range" {}
variable "az" {}
variable "subnet_name" {}

resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_range
  availability_zone = var.az
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}