

provider "aws" {
    region = var.region
}

resource "aws_vpc" "bsl_vpc" {
  cidr_block = var.bsl_vpc_cidr
}

resource "aws_subnet" "bsl_subnet_public" {
    vpc_id = aws_vpc.bsl_vpc.id
    cidr_block = var.cidr_ranges[0]
    availability_zone = "ap-south-1a"
}

resource "aws_subnet" "bsl_subnet_private" {
    vpc_id = aws_vpc.bsl_vpc.id
    cidr_block = var.cidr_ranges[1]
    availability_zone = "ap-south-1a"
}

resource "aws_instance" "web01" {
  ami           = var.ami_list[var.region]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.bsl_subnet_public.id

  tags = {
      Name = var.ec2_web
  }
}

resource "aws_instance" "app01" {
  ami           = var.ami_list[var.region]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.bsl_subnet_private.id

  tags = {
      Name = var.ec2_app
  }
}