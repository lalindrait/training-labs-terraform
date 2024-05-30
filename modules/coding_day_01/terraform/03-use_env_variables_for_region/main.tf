#################### NOTES ####################
# Run with empty provider block
# terraform will not prompt for region as ealier versions instead gives an error
# terraform read the .aws/config for region now if its not present env variable can be specified
# set enviornrment variable - export AWS_DEFAULT_REGION=ap-south-1
# check the variables - env | grep AWS
# unset the enviornrment variable - unset AWS_DEFAULT_REGION
#################### END OF NOTES #############

provider "aws" {}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "test-ec2"
      Owner = "MSD"
  }
}


