#################### NOTES ####################
# minimal terraform code that executes -This code creates a ec2 instance
# Terraform AWS provider documentation - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# can get rid of region in provider block if AWS_DEFAULT_REGION variable is set
# terraform seems to only read ~/.aws/credenstials file not config as it does not pick the region from there

# To check aws cli access use following 2 commands
# aws sts get-caller-identity
# aws iam list-account-aliases

# Use terrform fmt and terraform validate
#################### END OF NOTES #############

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"
}

