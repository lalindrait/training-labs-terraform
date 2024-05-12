provider "aws" {
    region = "ap-south-1"
    shared_credentials_file ="/home/lali/projects/mini-projects/terraform/aws_credentials"
    profile = "default"

}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = var.ec2_name
      Owner = var.ec2_owner
  }
}

