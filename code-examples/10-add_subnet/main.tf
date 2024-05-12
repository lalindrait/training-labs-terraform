### Both EC2 nd VPC will be created but still EC2 will be creted in the defult VCP
### There is no communication between the two reources. How can we achieve that ? Input/Output Variables

provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "bsl_vpc" {
  cidr_block = var.bsl_vpc_cidr
}

resource "aws_subnet" "bsl_subnet" {
    vpc_id = aws_vpc.bsl_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
}

resource "aws_instance" "bsl-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.bsl_subnet.id

  tags = {
      Name = var.ec2_name
      Owner = var.ec2_owner
  }
}

