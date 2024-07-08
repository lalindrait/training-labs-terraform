output "ec2_key_name" {
  value = aws_key_pair.ec2_keypair.key_name
}

output "ec2_public_ip" {
    value = aws_instance.ec2.public_ip
}