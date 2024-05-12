### Added output variable to output public ip of the web instance
### Command to connect : ssh -i cms_key_pair ec2-user@13.235.113.110

provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc_main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

module "subnet_public" {
  source = "./resource-modules/subnet/"
  vpc_id = aws_vpc.vpc_main.id
  cidr_range = var.cidr_ranges[0]
  az = "ap-south-1a"
  subnet_name = var.subnet_name_public
}

module "subnet_private" {
  source = "./resource-modules/subnet/"
  vpc_id = aws_vpc.vpc_main.id
  cidr_range = var.cidr_ranges[1]
  az = "ap-south-1a"
  subnet_name = var.subnet_name_private
}

module "sg_public" {
  source = "./resource-modules/security-group/"
  vpc_id           = aws_vpc.vpc_main.id
  sg_name     = var.sg_name_public
  ingress_port =  22
  ingress_cidr = ["0.0.0.0/0"]
  egress_port = 22
  egress_cidr = [var.cidr_ranges[1]]
}

module "sg_private" {
  source = "./resource-modules/security-group/"
  vpc_id           = aws_vpc.vpc_main.id
  sg_name     = var.sg_name_private
  ingress_port =  22
  ingress_cidr = [var.cidr_ranges[0]]
  egress_port = 22
  egress_cidr = [var.cidr_ranges[0]]
}

resource "aws_key_pair" "ec2_keypair" {
  key_name   = "cms_key_pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN3upsxii6spQRT1e8dcz7ofu52bre0dyVOB1pJ4XuV43UR1vdTHPJadIeysntjeyGzdGzukxjfLtIUC0zunyW5FbAiL734y/TLIHOwzFKMrbWlFeYXfRLHJe+cGJUL+I348bmGWkJ5jt4MKrhUFeZZHNmeOQ4u822U18HF1U2856cGPnD2JPXU9Apf4OjLg++WeEUAwR46JKT9muhQMPvBRgRROMhR7tqG1KDHnCehJTDtSQu89zMQ17KwU76Dmu9FwlsVd5P8YgI7dPtxRdCZTrw0HdYakLN3RRjVxAdjtHnUnm2maongnMm9lOLKY9EXlMvHVY6ODETs7mY/WJT lali@centos8"
}

module "ec2-web-01" {
  source = "./resource-modules/ec2/"
  ami_id           = "ami-01e074f40dfb9999d"
  subnet_id     = module.subnet_public.subnet_id
  sg_ids =  [module.sg_public.security_group_id]
  key_name = aws_key_pair.ec2_keypair.key_name
  ec2_name = "CMS-EC2-WEB-01"
}

module "ec2-app-01" {
  source = "./resource-modules/ec2/"
  ami_id           = "ami-01e074f40dfb9999d"
  subnet_id     = module.subnet_private.subnet_id
  sg_ids =  [module.sg_private.security_group_id]
  key_name = aws_key_pair.ec2_keypair.key_name
  ec2_name = "CMS-EC2-APP-01"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "cms_rtb" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rtb_name
  }
}

resource "aws_route_table_association" "rtb-asc" {
  subnet_id      = module.subnet_public.subnet_id
  route_table_id = aws_route_table.cms_rtb.id
}
