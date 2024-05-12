### Added output variable to output public ip of the web instance
### Command to connect : ssh -i cms_key_pair ec2-user@13.235.113.110

provider "aws" {
  region = var.region
}

module "cms_vpc" {
  source = "./resource-modules/vpc/"
  vpc_cidr = var.vpc_cidr
  vpc_name = "CMS-VPC"

}

module "subnet_public" {
  source = "./resource-modules/subnet/"
  vpc_id = module.cms_vpc.vpcid
  cidr_range = var.cidr_ranges[0]
  az = "ap-south-1a"
  subnet_name = var.subnet_name_public
}

module "subnet_private" {
  source = "./resource-modules/subnet/"
  vpc_id = module.cms_vpc.vpcid
  cidr_range = var.cidr_ranges[1]
  az = "ap-south-1a"
  subnet_name = var.subnet_name_private
}

module "sg_public" {
  source = "./resource-modules/security-group/"
  vpc_id           = module.cms_vpc.vpcid
  sg_name     = var.sg_name_public
  ingress_port =  22
  ingress_cidr = ["0.0.0.0/0"]
  egress_port = 22
  egress_cidr = [var.cidr_ranges[1]]
}

module "sg_private" {
  source = "./resource-modules/security-group/"
  vpc_id           = module.cms_vpc.vpcid
  sg_name     = var.sg_name_private
  ingress_port =  22
  ingress_cidr = [var.cidr_ranges[0]]
  egress_port = 22
  egress_cidr = [var.cidr_ranges[0]]
}

module "ec2_key" {
  source = "./resource-modules/ec2-keypair"
}

module "ec2-web-01" {
  source = "./resource-modules/ec2/"
  ami_id           = "ami-01e074f40dfb9999d"
  subnet_id     = module.subnet_public.subnet_id
  sg_ids =  [module.sg_public.security_group_id]
  key_name = module.ec2_key.key_name
  ec2_name = "CMS-EC2-WEB-01"
}

module "ec2-app-01" {
  source = "./resource-modules/ec2/"
  ami_id           = "ami-01e074f40dfb9999d"
  subnet_id     = module.subnet_private.subnet_id
  sg_ids =  [module.sg_private.security_group_id]
  key_name = module.ec2_key.key_name
  ec2_name = "CMS-EC2-APP-01"
}

module "igw" {
  source = "./resource-modules/internet-gateway/"
  vpcid = module.cms_vpc.vpcid
  igw_name = "cms_igw"
}

module "route_default" {
  source = "./resource-modules/route-table/"
  vpcid = module.cms_vpc.vpcid
  rtb_name = var.rtb_name
  igw_id = module.igw.igw_id
  subnet_id = module.subnet_public.subnet_id
}