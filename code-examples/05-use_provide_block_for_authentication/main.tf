### Ensure the env variables are not set - env | grep AWS
### Edit the provider block with credentials
### This method is not recomended as it stores credentials in text file and can be commited to a repo
### Never use this method

provider "aws" {
    region = "ap-south-1"
    access_key = "xxx"
    secret_key = "xxxx"
}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "bsl-ec2"
      Owner = "BSL-SL"
  }
}

