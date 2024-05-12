### Run with empty provider bl`ock
### terraform will prompt for region
### set enviornrment variable - export AWS_DEFAULT_REGION=ap-south-1
### check the variables - env | grep AWS
### unset the enviornrment variable - unset AWS_DEFAULT_REGION
### 

provider "aws" {}



resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "bsl-ec2"
      Owner = "BSL-SL"
  }
}


