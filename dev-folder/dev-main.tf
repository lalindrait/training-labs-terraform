provider "aws" {
    region = "ap-south-1"
    shared_credentials_files = ["/home/lalindra/secrets/aws_credentials"]
    profile = "default"

}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = "test-ec2"
      Owner = "MSD"
  }
}
