### Can provide variables values in 6 ways
### 1 - Using default parameter in the deifnition
### 2 - Using -var command aruguements
### 3 - Using a terraform.tfvars file
### 4 - Provide your own file with -var-file
### 5 - From environment variables (TF_VAR_varname)
### 6 - UI input (terraform will prompt for values) Only supported for strings not for lists and maps
### If none is present default value is used in the declaration
### When using files all files which match terraform.tfvars or *.auto.tfvars present in the current directory, 
### Terraform automatically loads them to populate variables


provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "bsl_vpc" {
  cidr_block = var.bsl_vpc_cidr
}

resource "aws_subnet" "bsl_subnet" {
    vpc_id = aws_vpc.bsl_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
}

resource "aws_instance" "bsl-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.bsl_subnet.id

  tags = {
      Name = var.ec2_name
      Owner = var.ec2_owner
  }
}

