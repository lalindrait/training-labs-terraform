# Notes - Coding Day 01

## Few things to be aware before starting coding with terraform

**1. Ignore terraform files and directories from git using .gitignore**
- You dont need to commit any directories and files created by terraform to the gir repo. 
- This includes .terraform directory and state files. 
- .terraform directory has providers and can amount to a large size 
- Make sure you do this before your first commit

**2. Use a provider plugin cache directory**
- By default, terraform init downloads plugins into a subdirectory of the working directory so that each working directory is self-contained.
- If yo do developement in multiples directcories download will  happen for each directory
- This may lead to lot of network bandwidth and file system usage
- Use this link to configure a plugin cache dir - https://developer.hashicorp.com/terraform/cli/config/config-file

