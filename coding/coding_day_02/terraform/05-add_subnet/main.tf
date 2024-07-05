#################### NOTES ####################
# Adding a subnet to the vpc 
#################### END OF NOTES #############

resource "aws_vpc" "my_vpc" {
  cidr_block = var.msd_vpc_cidr
}

resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.cidr_block
    availability_zone = var.availability_zone

  tags = {
    Name = "sdb-subnet"
  }
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
      Name = var.ec2_name
      Owner = var.ec2_owner
  }
}

