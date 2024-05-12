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

resource "aws_subnet" "snt_public" {
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.cidr_ranges[0]
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

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

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
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

resource "aws_key_pair" "ec2_keypair" {
  key_name   = "cms_key_pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN3upsxii6spQRT1e8dcz7ofu52bre0dyVOB1pJ4XuV43UR1vdTHPJadIeysntjeyGzdGzukxjfLtIUC0zunyW5FbAiL734y/TLIHOwzFKMrbWlFeYXfRLHJe+cGJUL+I348bmGWkJ5jt4MKrhUFeZZHNmeOQ4u822U18HF1U2856cGPnD2JPXU9Apf4OjLg++WeEUAwR46JKT9muhQMPvBRgRROMhR7tqG1KDHnCehJTDtSQu89zMQ17KwU76Dmu9FwlsVd5P8YgI7dPtxRdCZTrw0HdYakLN3RRjVxAdjtHnUnm2maongnMm9lOLKY9EXlMvHVY6ODETs7mY/WJT lali@centos8"
}

# resource "aws_instance" "web01" {
#   ami           = var.ami_list[var.region]
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.snt_public.id
#   vpc_security_group_ids = [aws_security_group.sg_public.id]
#   key_name = aws_key_pair.ec2_keypair.key_name

#   tags = {
#     Name = var.ec2_web
#   }

#   provisioner "local-exec" {
#     command = "echo web01-publicIP : ${aws_instance.web01.public_ip} >> ips.txt"
#   }
# }

# resource "aws_instance" "app01" {
#   ami           = var.ami_list[var.region]
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.snt_private.id
#   vpc_security_group_ids = [aws_security_group.sg_private.id]
  
#   tags = {
#     Name = var.ec2_app
#   }

#   provisioner "local-exec" {
#     command = "echo app01-privateIP : ${aws_instance.app01.private_ip} >> ips.txt"
#   }
# }

module "ec2-web-01" {
  source = "./resource-modules/ec2/"
  ami_id           = "ami-01e074f40dfb9999d"
  subnet_id     = aws_subnet.snt_public.id
  sg_ids =  [aws_security_group.sg_public.id]
  key_name = aws_key_pair.ec2_keypair.key_name
  ec2_name = "CMS-EC2-WEB-01"

}

module "ec2-app-01" {
  source = "./resource-modules/ec2/"
  ami_id           = "ami-01e074f40dfb9999d"
  subnet_id     = aws_subnet.snt_private.id
  sg_ids =  [aws_security_group.sg_private.id]
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
  subnet_id      = aws_subnet.snt_public.id
  route_table_id = aws_route_table.cms_rtb.id
}
