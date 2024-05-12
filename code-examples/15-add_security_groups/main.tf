### Added security groups and associated with ec2s
### vpc_security_group_ids needs to be a slit use [] 
### Adds Name tag for all resources for easy identification


provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc_main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "snt_public" {
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.cidr_ranges[0]
  availability_zone = "ap-south-1a"

  tags = {
    Name = var.subnet_name_public
  }
}

resource "aws_subnet" "snt_private" {
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.cidr_ranges[1]
  availability_zone = "ap-south-1a"

  tags = {
    Name = var.subnet_name_private
  }
}

resource "aws_security_group" "sg_public" {
  name        = var.sg_name_public
  description = "Security group for web server"
  vpc_id      = aws_vpc.vpc_main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name_public
  }

}
  
resource "aws_security_group" "sg_private" {
  name        = var.sg_name_private
  description = "Security group for app server"
  vpc_id      = aws_vpc.vpc_main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  tags = {
    Name = var.sg_name_private
  }

}

resource "aws_instance" "web01" {
  ami           = var.ami_list[var.region]
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.snt_public.id
  vpc_security_group_ids = [aws_security_group.sg_public.id]

  tags = {
    Name = var.ec2_web
  }
}

resource "aws_instance" "app01" {
  ami           = var.ami_list[var.region]
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.snt_private.id
  vpc_security_group_ids = [aws_security_group.sg_private.id]
  
  tags = {
    Name = var.ec2_app
  }
}