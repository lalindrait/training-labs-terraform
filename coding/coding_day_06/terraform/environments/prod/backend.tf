terraform {
  backend "s3" {
    bucket         = "s3-mumbai-msd-terraform-state"
    region         = "ap-south-1"
    encrypt        = "true"
    dynamodb_table = "ddb-mumbai-msd-terraform-locktable"
    key            = "devops-testbed/ap-south-1/production/terraform.tfstate"
  }
}