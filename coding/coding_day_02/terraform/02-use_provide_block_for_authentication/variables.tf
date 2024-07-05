variable "ec2_name" {
    default = "msd-ec2"
    # Will be provided as command arguement - terraform apply -var 'ec2_name=msd-ec2'
} 

variable "ec2_owner" {
    default = "MSD"
} 