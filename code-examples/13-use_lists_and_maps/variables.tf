variable "region" {
    default = "ap-south-1"
}

variable "ec2_name" {
    default = "bsl-ec2"
} 

variable "ec2_owner" {
    default = "BSL-SL"
} 

variable "bsl_vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "cidr_ranges" {
    default = [
        "10.0.1.0/24",
        "10.0.2.0/24",
        "10.0.3.0/24"
    ]
}

variable "ami_list" {
    type = map
    default = {
        "ap-south-1" = "ami-01e074f40dfb9999d"
        "use-east-1" = "ami-09d069a04349dc3cb"
        "ap-southeast-1" = "ami-0d9233e8ce73df7b2"
    }
}


