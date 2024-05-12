variable "vpcid" {}
variable "igw_name" {}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpcid

  tags = {
    Name = var.igw_name
  }
}