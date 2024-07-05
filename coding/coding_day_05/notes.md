## Using terraform docs
```
# https://terraform-docs.io/user-guide/installation/

# installing terraform-docs
curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.18.0/terraform-docs-v0.18.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
mv terraform-docs /usr/bin/terraform-docs

# creating docs
terraform-docs markdown .
terraform-docs markdown . > TF_REDAME.md
```