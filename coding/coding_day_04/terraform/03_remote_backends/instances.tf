#################### NOTES ####################
# Instances and related resources
#################### END OF NOTES #############

############## Security Groups ##################

### public security groups
resource "aws_security_group" "sdb_sg_public" {
  name        = "sg_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_public-access"
  description = "Security group for accessing public subnets"
  vpc_id      = aws_vpc.sdb_vpc.id

  tags = merge(local.common_tags,
    tomap(
      {
      "Name" = "sg_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_public-access"
      }
    )
  )
}

resource "aws_vpc_security_group_ingress_rule" "sdb_sg_public_ingress" {
  security_group_id = aws_security_group.sdb_sg_public.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "sdb_sg_public_egress" {
  security_group_id = aws_security_group.sdb_sg_public.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
  # from_port   = 0
  # to_port     = 0
}


### app private security groups
resource "aws_security_group" "sdb_sg_private" {
  name        = "sg_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_private-access"
  description = "Security group for accessing app subnets"
  vpc_id      = aws_vpc.sdb_vpc.id

  tags = merge(local.common_tags,
    tomap(
      {
      "Name" = "sg_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_private-access"
      }
    )
  )
}

resource "aws_vpc_security_group_ingress_rule" "sdb_sg_private_ingress" {
  security_group_id = aws_security_group.sdb_sg_private.id

  referenced_security_group_id  = aws_security_group.sdb_sg_public.id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "sdb_sg_private_egress" {
  security_group_id = aws_security_group.sdb_sg_private.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
  # from_port   = 0
  # to_port     = 0
}


############# EC2 Instances ##################

resource "aws_instance" "nat_ec2" {
  count = var.nat_ec2_count

  ami           = var.ami_id[var.region]
  instance_type = var.instance_type
  subnet_id = aws_subnet.sdb_public_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.sdb_sg_public.id]
  key_name = aws_key_pair.sdb_ec2_keypair.key_name

  tags = merge(local.common_tags,
  tomap(
    {
    "Name" = "ec2_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_${var.nat_ec2_name}_${count.index+1}"
    }
   )
  )
}

resource "aws_instance" "app_ec2" {
  count = var.app_ec2_count

  ami           = var.ami_id[var.region]
  instance_type = var.instance_type
  subnet_id = aws_subnet.sdb_private_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.sdb_sg_private.id]
  key_name = aws_key_pair.sdb_ec2_keypair.key_name

  tags = merge(local.common_tags,
  tomap(
    {
    "Name" = "ec2_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_${var.app_ec2_name}_${count.index+1}"
    }
   )
  )
}


############# EC2 key Pairs ##################

resource "aws_key_pair" "sdb_ec2_keypair" {
  key_name   = var.sdb_ec2_keypair_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8FJvKvNIfdgu1Ry2mc7JxDKq5bc82jhwkh6r9huFM0NG/E5ciqKRdArQeo6qXl3rEZjCAIizZzv26/jtTZJ/SUEQHjiHsIJiIk1HDMhYxKnYFPKXonGis4j2auXwmKDcld+RwtfAeo9GrF0h+5CDZ3x8JzwnG1lWs/ipxI2VKEE/tCD6/Lj29CAwWmQHOkjF9Dd+PlNe1OS9qc9pz1zDiIJlg0Dw+l7QSDarwnThreFSlQBAYHIiyEFoSFvXziJVu7AArpJ1QNUJ1Pa6aO2n5oBZeUn+RPVwpQ5PJB+BJLSson0340y2aBSzdfgMWxfQobPdf/IxT7Np1Nh90lK27ynfDNKDVEqZHSCu/Nzw0pKiy7bcTyYyxAMwm5E/biDNHO/2a9W/iYvLa77GJJHhzWD4DScQ5VK/3KL0sWyYD0B33jB9nJ9zWgImLi4pj2iSjyRSMwDHi8g3lfx4dl7EbrTX5Rrhe0RW3MF8PvGroClUglCY5GBtu5GUp10DOpg8= lalindra@rocky91-lab"

    tags = merge(local.common_tags,
  tomap(
    {
    "Name" = "keypair_${var.region_short_names[var.region]}_${var.app_name}_${var.app_env}_keypair_01"
    }
   )
  )
}
