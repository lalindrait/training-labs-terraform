output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "app_ec2_private_ips" {
    value = aws_instance.app_ec2.*.private_ip
}

output "nat_ec2_public_ips" {
    value = aws_instance.nat_ec2.*.public_ip
}