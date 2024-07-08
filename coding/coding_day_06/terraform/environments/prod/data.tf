# data "terraform_remote_state" "stack" {
#   backend = "s3"

#   config = {
#     bucket  = "YOUR_ORG-tfstate-backends"
#     region  = "us-east-1"
#     encrypt = true

#     dynamodb_table = "tfstates-lock-TABLE_THAT_DOES_NOT_EXIST"
#     key            = "test-remote-config-lock-bug/terraform.tfstate"
#   }
# }