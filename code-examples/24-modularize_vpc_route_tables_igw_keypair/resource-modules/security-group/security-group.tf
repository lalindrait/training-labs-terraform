variable "vpc_id" {}
variable "sg_name" {}
variable "ingress_port" {}
variable "ingress_cidr" {}
variable "egress_port" {}
variable "egress_cidr" {}

resource "aws_security_group" "security_group" {
  name        = var.sg_name
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr
  }

  egress {
    from_port       = var.egress_port
    to_port         = var.egress_port
    protocol        = "tcp"
    cidr_blocks     = var.egress_cidr
  }
}

