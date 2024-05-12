variable "ami_id" {}
variable "subnet_id" {}
variable "sg_ids" {}
variable "key_name" {}
variable "ec2_name" {}

resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.sg_ids
  key_name = var.key_name

  tags = {
    Name = var.ec2_name
  }
}