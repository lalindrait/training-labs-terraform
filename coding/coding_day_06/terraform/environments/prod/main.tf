module "msd_testbed_vpc" {
  source = "../../modules/network/base-network/"

  vpc_cidr                   = "10.0.0.0/16"
  public_subnet_cidr_ranges  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_ranges = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  azs                        = ["${var.region}a", "${var.region}b", "${var.region}c"]

  tags = local.tags
}

module "msd_testbed_ec2_jenkins_master" {
  source = "../../modules/compute/ec2"

  instance_type        = "t2.micro"
  ami_id               = "ami-01e074f40dfb9999d"
  instance_name_suffix = "jenkins_master"

  subnet_id          = module.msd_testbed_vpc.public_subnet_ids[0]
  security_group_ids = [module.msd_testbed_vpc.security_group_internet_access]

  tags = local.tags
}

module "msd_testbed_ec2_jenkins_slaves" {
  source = "../../modules/compute/ec2"

  count = 2

  instance_type        = "t2.micro"
  ami_id               = "ami-01e074f40dfb9999d"
  instance_name_suffix = "jenkins_slave_${count.index + 1}"

  subnet_id          = module.msd_testbed_vpc.public_subnet_ids[count.index]
  security_group_ids = [module.msd_testbed_vpc.security_group_internet_access]

  tags = local.tags
}