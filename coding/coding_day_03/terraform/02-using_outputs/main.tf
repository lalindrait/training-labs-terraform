#################### NOTES ####################
# Using output variables
#################### END OF NOTES #############

resource "aws_vpc" "my_vpc" {
  cidr_block = var.msd_vpc_cidr
}

resource "aws_subnet" "my_public_subnet" {
    count = length(var.public_subnet_cidr_ranges)

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.public_subnet_cidr_ranges[count.index]
    availability_zone = data.aws_availability_zones.available_azs.names[count.index]
    map_public_ip_on_launch = true

  tags = {
    Name = "snt_${var.region_short_names[var.region]}_public_${data.aws_availability_zones.available_azs.names[count.index]}"
    Owner = var.ec2_owner
  }
}

resource "aws_subnet" "my_private_subnet" {
    count = length(var.private_subnet_cidr_ranges)

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.private_subnet_cidr_ranges[count.index]
    availability_zone = data.aws_availability_zones.available_azs.names[count.index]

  tags = {
    Name = "snt_${var.region_short_names[var.region]}_private_${data.aws_availability_zones.available_azs.names[count.index]}"
    Owner = var.ec2_owner
  }
}

resource "aws_subnet" "my_db_subnet" {
    count = length(var.db_subnet_cidr_ranges)

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.db_subnet_cidr_ranges[count.index]
    availability_zone = data.aws_availability_zones.available_azs.names[count.index]

  tags = {
    Name = "snt_${var.region_short_names[var.region]}_db_${data.aws_availability_zones.available_azs.names[count.index]}"
    Owner = var.ec2_owner
  }
}

resource "aws_instance" "app_ec2" {
  count = 2

  ami           = var.ami_id[var.region]
  instance_type = var.instance_type
  subnet_id = aws_subnet.my_private_subnet[count.index].id

  tags = {
      Name = "ec2_${var.region_short_names[var.region]}_${var.app_ec2_name}_${count.index+1}"
      Owner = var.ec2_owner
  }
}

resource "aws_instance" "nat_ec2" {
  count = 1

  ami           = var.ami_id[var.region]
  instance_type = var.instance_type
  subnet_id = aws_subnet.my_public_subnet[count.index].id

  tags = {
      Name = "ec2_${var.region_short_names[var.region]}_${var.nat_ec2_name}_${count.index+1}"
      Owner = var.ec2_owner
  }
}

