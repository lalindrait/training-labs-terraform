### Both EC2 nd VPC will be created but still EC2 will be creted in the defult VCP
### There is no communication between the two reources. How can we achieve that ? Input/Output Variables

provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "bsl_vpc" {
  cidr_block = var.bsl_vpc_cidr
}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = var.ec2_name
      Owner = var.ec2_owner
  }
}

