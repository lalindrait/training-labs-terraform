provider "aws" {
  region = "ap-south-1"
}

variable "ec2_name" {
    default = "msd-ec2"
} 

variable "ec2_owner" {
    default = "MSD"
} 

resource "aws_instance" "my_ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = var.ec2_name
      Owner = var.ec2_owner
  }
}

