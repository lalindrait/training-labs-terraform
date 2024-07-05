#################### NOTES ####################
# unset all env variables and empty the ~/.aws/credentils file
# add the provider line to use shared cred file

# Configuration for the AWS Provider can be derived from several sources, which are applied in the following order:
# 1 - Parameters in the provider configuration
# 2 - Environment variables
# 3 - Shared credentials files
# 4 - Shared configuration files - $HOME/.aws/config & $HOME/.aws/credentials
# 5 - Container credentials
# 6 - Instance profile credentials and Region
# This order matches the precedence used by the AWS CLI and the AWS SDKs.
#################### END OF NOTES #############

provider "aws" {
    region = "ap-south-1"
    shared_credentials_files = ["/home/lalindra/secrets/aws_credentials"]
    profile = "default"
}
