#################### NOTES ####################
# 1 - Copy the credentials to a seperate file as a backup
# 2 - Delete the credentials file and run terraform apply terraform will complain - >~/.aws/credentials
# 3 - Set the environement variables
# 4 - export AWS_ACCESS_KEY_ID=xxx
# 4 - export AWS_SECRET_ACCESS_KEY=xxx
# 4 - export AWS_DEFAULT_REGION=ap-south-1
# 5 - unset AWS_ACCESS_KEY_ID AWS_ACCESS_KEY_ID AWS_DEFAULT_REGION
#################### END OF NOTES #############

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "test-ec2"
      Owner = "MSD"
  }
}



