#################### NOTES ####################
# Change resource by adding tags 
# terraformrc documentation -  https://developer.hashicorp.com/terraform/cli/config/config-file#provider-plugin-cache
# Configure "Provider Plugin Cache" as per the instruction above - Use .terraformrc file and env variable
#################### END OF NOTES #############

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "test-ec2"
      Owner = "MSD"
  }
}

