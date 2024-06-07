#################### NOTES ####################
# Base Network Resources
#################### END OF NOTES #############

############## VPC, IGW & Subnets ##################

resource "aws_vpc" "sdb_vpc" {
  cidr_block = var.sdb_vpc_cidr

    tags = {
    Name = "vpc_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_vpc-01"
    Owner = var.app_owner
  }
}

resource "aws_subnet" "sdb_public_subnet" {
    count = length(var.public_subnet_cidr_ranges)

    vpc_id = aws_vpc.sdb_vpc.id
    cidr_block = var.public_subnet_cidr_ranges[count.index]
    availability_zone = data.aws_availability_zones.available_azs.names[count.index]
    map_public_ip_on_launch = true
}

resource "aws_subnet" "sdb_private_subnet" {
    count = length(var.private_subnet_cidr_ranges)

    vpc_id = aws_vpc.sdb_vpc.id
    cidr_block = var.private_subnet_cidr_ranges[count.index]
    availability_zone = data.aws_availability_zones.available_azs.names[count.index]
}

resource "aws_subnet" "sdb_db_subnet" {
    count = length(var.db_subnet_cidr_ranges)

    vpc_id = aws_vpc.sdb_vpc.id
    cidr_block = var.db_subnet_cidr_ranges[count.index]
    availability_zone = data.aws_availability_zones.available_azs.names[count.index]
}


############## IGW & Route Tables ##################

resource "aws_internet_gateway" "sdb_igw" {
  vpc_id = aws_vpc.sdb_vpc.id

  tags = {
    Name = "igw_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_igw-01"
    Owner = var.app_owner
  }
}

resource "aws_route_table" "sdb_public_rtb" {
  vpc_id = aws_vpc.sdb_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sdb_igw.id
  }

  tags = {
    Name = "rtb_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_public"
    Owner = var.app_owner
  }
}

resource "aws_route_table_association" "sdb_public_rtb_asc" {
  count = length(var.public_subnet_cidr_ranges)

  subnet_id      = element(aws_subnet.sdb_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.sdb_public_rtb.id
}
