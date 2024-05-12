variable "vpcid" {}
variable "rtb_name" {}
variable "igw_id" {}
variable "subnet_id" {}

resource "aws_route_table" "rtb" {
  vpc_id = var.vpcid

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.rtb_name
  }
}

resource "aws_route_table_association" "rtb_asc" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.rtb.id
}

