variable "region" {
    default = "ap-south-1"
}

variable "region_short_names" {
  type = map(string)
  default = {
    us-east-1  = "nv"
    ap-south-1  = "mumbai"
    ap-southeast-1  = "sing"
  }
}

variable "service_name" {
    default = "sdb"
} 

############## VPC, IGW & Subnets ##################

variable "sdb_vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr_ranges" {
    default = [
        "10.0.1.0/24",
        "10.0.2.0/24",
        "10.0.3.0/24"
    ]
}

variable "private_subnet_cidr_ranges" {
    default = [
        "10.0.4.0/24",
        "10.0.5.0/24",
        "10.0.6.0/24"
    ]
}

variable "db_subnet_cidr_ranges" {
    default = [
        "10.0.7.0/24",
        "10.0.8.0/24",
        "10.0.9.0/24"
    ]
}

variable "availability_zone" {
    default = "ap-south-1a"
} 

############## Security Groups ##################
# variable "sg_name_public" {
#     default = "t2.micro"
# } 







############## EC2 Instances ##################

variable "ami_id" {
  type = map(string)
  default = {
    us-east-1  = "ami-00beae93a2d981137"
    ap-south-1  = "ami-00fa32593b478ad6e"
    ap-southeast-1  = "ami-0b287aaaab87c114d"
  }
}

variable "instance_type" {
    default = "t2.micro"
} 

variable "app_ec2_name" {
    default = "sdb"
}

variable "nat_ec2_name" {
    default = "nat"
}

variable "sdb_ec2_keypair_name" {
    default = "sdb_key_pair"
} 

variable "ec2_owner" {
    default = "MSD"
}