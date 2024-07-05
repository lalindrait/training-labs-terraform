#################### NOTES ####################
# using provider block for authentication
# Ensure the env variables are not set - env | grep AWS
# Edit the provider block with credentials
# This method is not recomended as it stores credentials in text file and can be commited to a repo
# Never use this method
#################### END OF NOTES #############

provider "aws" {
    region = "ap-south-1"
    access_key = "xxx"
    secret_key = "xxxx"
}