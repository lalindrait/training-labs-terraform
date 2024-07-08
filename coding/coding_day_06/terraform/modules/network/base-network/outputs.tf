# output "vpcid" {
#   value = aws_vpc.vpc.id
# }

output "public_subnet_ids" {
  value = aws_subnet.public_subnet.*.id
}

output "security_group_internet_access" {
  value = aws_security_group.security_group_internet_access.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}