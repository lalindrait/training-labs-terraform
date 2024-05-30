### unset all env variables and empty the ~/.aws/credentils file
### add the provide line to use shared cred file
### Five ways to authenticat and supply regions parameter to provider
### 1 - Use the ~/.aws credentails file
### 2 - Use environement variables
### 3 - Use satic credentials - Define the secrets in the provider block
### 4 - Use a shared credentials file - DEfine it in the provider block
### 5 - Use and EC2 role - Preferred approach as it avoids hard cording or storing any credentials andzero chance of leakage


provider "aws" {
    region = "ap-south-1"
    shared_credentials_file ="/home/lali/projects/mini-projects/terraform/aws_credentials"
    profile = "default"

}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "bsl-ec2"
      Owner = "BSL-SL"
  }
}


