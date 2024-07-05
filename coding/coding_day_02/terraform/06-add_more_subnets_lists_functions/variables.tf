variable "msd_vpc_cidr" {
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

variable "ami_id" {
    default = "ami-01e074f40dfb9999d"
} 

variable "instance_type" {
    default = "t2.micro"
} 

variable "ec2_name" {
    default = "msd-ec2"
} 

variable "ec2_owner" {
    default = "MSD"
}