output "jenkins_master_public_ip" {
  value = module.msd_testbed_ec2_jenkins_master.ec2_public_ip
}

output "jenkins_slaves_public_ip" {
  value = module.msd_testbed_ec2_jenkins_slaves.*.ec2_public_ip
}