#################### NOTES ####################
# In terraform you can provide variable values in 6 ways
# 1 - Using default parameter in the definition
# 2 - Using -var command aruguements
# 3 - Using a terraform.tfvars file
# 4 - Provide your own file with -var-file
# 5 - From environment variables (TF_VAR_varname)
# 6 - UI input (terraform will prompt for values) Only supported for strings not for lists and maps
# If none is present default value is used in the declaration
# When using var files all files which match terraform.tfvars or *.auto.tfvars present in the current directory is used by default. Terraform automatically loads them to populate variables
# If not custom var file canbe injected using -var-file command arguement
#  terraform apply -var-file="testing.tfvars"
#################### END OF NOTES #############

resource "aws_instance" "my-ec2" {
  ami           = "ami-01e074f40dfb9999d"
  instance_type = "t2.micro"

  tags = {
      Name = var.ec2_name
      Owner = var.ec2_owner
  }
}

