#################### NOTES ####################
# Two things need to be done prior to running this code
# 1 - Create the s2 bucket in the specified region
# 2 - Create the DynamoDB Lock Table with partition key LockID (String)
#################### END OF NOTES #############
# https://developer.hashicorp.com/terraform/language/settings/backends/s3


terraform {
    backend "s3" {
        region = "ap-south-1"
        bucket = "msd-terraform"
        key = "sdb/ap-south-1/terraform.tfstate"
        dynamodb_table = "terraform-lock-table"
        encrypt = true
    }
}
