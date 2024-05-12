variable "ec2_name" {
    //Will be provided as command arguement - terraform apply -var 'ec2_name=lali-ec2'
    # default = "bsl-ec2"
} 

variable "ec2_owner" {
    default = "BSL-SL"
} 

variable "bsl_vpc_cidr" {
    default = "10.0.0.0/16"
} 



