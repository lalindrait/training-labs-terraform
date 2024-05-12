### Change infra by adding tags 

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "bsl-ec2"
      Owner = "BSL-SL"
  }
}

