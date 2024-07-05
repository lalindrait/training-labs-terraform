variable "msd_vpc_cidr" {
    default = "10.0.0.0/16"
} 

variable "cidr_block" {
    default = "10.0.1.0/24"
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