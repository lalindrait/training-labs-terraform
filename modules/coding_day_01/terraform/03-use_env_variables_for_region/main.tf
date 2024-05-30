#################### NOTES ####################
# Running code with empty provider block 
# Doc LInk - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# terraform will not prompt for region as ealier versions instead gives an error
# terraform read the .aws/config for region now if its not present in the region block. env variable can be specified
# region in the provider block takes precendece over .aws/config
# set enviornrment variable - export AWS_DEFAULT_REGION=ap-south-1
# check the variables - env | grep AWS
# unset the enviornrment variable - unset AWS_DEFAULT_REGION
#################### END OF NOTES #############

provider "aws" {}

resource "aws_instance" "my_ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "test-ec2"
      Owner = "MSD"
  }
}


