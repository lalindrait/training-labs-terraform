# CHANGELOG - MSD Terraform

# Hotfix Release 7.16.2

## Updated

- master_default_policy.json file was renamed as prod_default_policy.json.

# Hotfix Release 7.16.1

## Removed

- Removed ignore_changes to aws_route53_resolver_rule_association as it was not working
  for same cases and end up with terraform plan failing

# Minor Release 7.16.0

## Added

- Added ignore_changes to aws_route53_resolver_rule_association to avoid to re-create
  existing rule associations every time we add new resolver rules.

# Minor Release 7.15.0

## Added

- Added waf-logs-s3 Ansible role for provisioning of centralized S3 bucket for
  WAF logs collection from tenant accounts.
- Added wafLogsReplicate Ansible role for enabling replication of WAF logs from
  tenant accounts to the Centralized S3 bucket.

# Feature Release 7.14.0

## Added

- Implemented logic to enforce VPC deployment within Zone_IDs use1-az1, use1-az2
  and use1-az4 in us-east-1 region.
- Unit tests for the aws_support.py Python script.

## Changed

- Decoupled the aws_support.py Python script into smaller more specific
  functions.

# Hotfix Release 7.13.1

## Added

- Added eu-south-1 to peer_region variable

# Minor Release 7.13.0

## Added

- Support for /25 and /26 VPC CIDR
- Support for 2 AZs and Larger DMZ template
- Support for global VPC

## Changed
- Set -RSCH and -CDS account as PRODUCTION account
- Minor update to the README.

## Removed

- Removed VPC Go tests.

# Minor Release 7.12.0

## Added

- Added configuration for Milan region

# Minor Release 7.11.0

## Added

- Added TGW Peering route table propagation for VPCs
- Enable CloudTrail logs in CloudHealth

# Minor Release 7.10.0

## Added

- Added option to run 99_extra_cnf_step for vpc specific rather than just region specific

# Minor Release 7.9.0

## Changed

- Set eu-west-2 as CNF region to allow new accounts to be built on CNF
- Removed VPN creation for eu-west-1 and eu-west-2 as part of CNF migration

# Minor Release 7.8.0

## Added

- Updated adfsrolesetup to create new role with 3hrs token duration

# Minor Release 7.7.0

## Added

- New jenkins pipeline and python script for subnet CIDR report
- New lifecycle policy for cloudtrail logs bukets with 730 expiration days
- New App-Tier SG rules to allow connectivity to join EC2 into MAD domain

# Minor Release 7.6.0

## Added

- New guardduty-notifications role (will be attached the our logging accounts in
  the organizations we want alerts about GuardDuty Findings) that will create the
  following:
    - CloudWatch Event Rule that will catch all GuardDuty Findings with severity medium and high.
    - CloudWatch Event Target for the above Rule.
    - CloudFormation Stack that will create the following resources:
        - SNS Topic which will be the target of the CW Event Target
        - Email subscription for the SNS Topic

__N.b.__ The reason a CloudFormation Stack is necessary is because Terraform
doesn't support the email subscription protocol.

## Changed

- Set eu-west-1, us-east-1 and us-east-2 as CNF regions to allow new accounts to be built on CNF
- Restructure python tests folder to adhere to our standard python folder
  structure.
- Added an argparser to the aws_name_check.py for better management of input
  variables.
- Integrated Vault retrieval capabilities so as to remove hardcoded config in
  the python code, specifically business unit and environment name config, and
  placed them in vault kv.
- Added unit tests to the aws_name_check.py python script.
- Updated the vault service module to be able to put objects in Vault. This was
  updated in another repository, and the functionality is not currently being used
  in this repository, though in the absence of Pypi we're trying to keep the
  modules aligned.

# Minor Release 7.5.0

## Added

- New permissions for the bsl-dome9-readonly-assume-role.
- Provider to the vpc-second-cidr role, as it was using the provider without passing
  in the region, thus using the default region, i.e. eu-west-2.
- Datadog role to Sandbox.

## Changed

- ServiceBoundary and TenantAdminPolicy to allow cross account access.
- DXG Proposal Role: Moved variables.tf from /files to /templates as Ansible needs to run Jinja against it.

# Hotfix Release 7.4.1

## Updated

- VPC flowlogs to use the correct logging S3 bucket

# Minor Release 7.4.0

## Added

- cloudtrail-s3 role which creates S3 buckets for each LOGGING account organization
- S3 bucket for datadog log archives

## Updated

- cloudtrail to use the correct logging S3 bucket

# Minor Release 7.3.0

- Create Qualys IAM role and onboard accounts in Qualys
- Clean up ServiceroleBoundary & TenantAdminPolicy to bring them inline with SCP's

# Minor Release 7.2.0

- Create OperationsReadOnly role


# Hotfix Release 7.1.1

- Fixed the resource name for sandbox quota


