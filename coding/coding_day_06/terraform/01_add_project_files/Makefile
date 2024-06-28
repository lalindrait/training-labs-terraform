SHELL := /usr/bin/bash 

# Update the following variable with the dirs with terraform files
TERRAFORM_DIRS = . examples/read-tags
 
all: terraform-fmt terraform-validate terraform-docs
 
terraform-fmt:
	@echo "===== Performing a Terraform format"
	terraform fmt -recursive
 
terraform-validate:
	for tf_dir in $(TERRAFORM_DIRS); do \
		echo "===== Performing Terraform validate on : $$tf_dir"; \
		cd $$tf_dir; \
		terraform init --backend=false; \
		terraform validate; \
	done

terraform-docs:
	for tf_dir in $(TERRAFORM_DIRS); do \
		echo "===== Updating Terraform Documentation on : $$tf_dir"; \
		printf "$$(terraform-docs markdown $$tf_dir)" > $$tf_dir/README.md; \
	done