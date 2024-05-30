#################### NOTES ####################
# unset all env variables and empty the ~/.aws/credentils file
# add the provide line to use shared cred file

# Configuration for the AWS Provider can be derived from several sources, which are applied in the following order:
# 1 - Parameters in the provider configuration
# 2 - Environment variables
# 3 - Shared credentials files
# 4 - Shared configuration files
# 5 - Container credentials
# 6 - Instance profile credentials and Region
# This order matches the precedence used by the AWS CLI and the AWS SDKs.
#################### END OF NOTES #############

provider "aws" {
    region = "ap-south-1"
    shared_credentials_files = ["/home/lalindra/secrets/aws_credentials"]
    profile = "default"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "test-ec2"
      Owner = "MSD"
  }
}


