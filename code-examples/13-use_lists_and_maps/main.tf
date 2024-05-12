

provider "aws" {
    region = var.region
}

resource "aws_vpc" "bsl_vpc" {
  cidr_block = var.bsl_vpc_cidr
}

resource "aws_subnet" "bsl_subnet" {
    vpc_id = aws_vpc.bsl_vpc.id
    cidr_block = var.cidr_ranges[1]
    availability_zone = "ap-south-1a"
}

resource "aws_instance" "bsl-ec2" {
  ami           = var.ami_list[var.region]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.bsl_subnet.id

  tags = {
      Name = var.ec2_name
      Owner = var.ec2_owner
  }
}

