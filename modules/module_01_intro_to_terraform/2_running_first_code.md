# First terraform code

## Check the current setup

```
# check the terraform version
terraform --version                     # Must be the latest version

# check aws cli fucntionality
aws sts get-caller-identity
aws iam list-account-aliases
```

## Run the terraform 
```
# code & run the terraform code
mkdir terraform

# initialize the directory
# Init will create a .terraform directory and download the neessary provider pulgins
terraform init

# do a plan before executing the code to verify resource changes
terraform plan

# if everything is in order execute the code
terraform apply

# destroy the resources
terraform destroy

# add the code to git repo
git status
git add .
git commit -m "Initial commit"
git push

```