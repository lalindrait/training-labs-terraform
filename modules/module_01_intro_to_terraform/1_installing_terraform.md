# Installing terraform

## Useful links
Installation instrcutions \
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Download link \
https://developer.hashicorp.com/terraform/install


## Installing terraform
```
# Install the terraform binary
wget https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_amd64.zip
unzip terraform_1.8.3_linux_amd64.zip
mv terraform /usr/bin/

# Verify installation
terraform

# Enable auto-complete
terraform -install-autocomplete
```