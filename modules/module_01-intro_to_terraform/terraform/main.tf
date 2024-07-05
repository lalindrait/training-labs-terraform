### Minimal terraform code that executes
### Can get rid of region is AWS_DEFAULT_REGION variable is set
### terraform seems to only read ~/.aws/credenstials file not config as it does not pick the region from there

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"
}