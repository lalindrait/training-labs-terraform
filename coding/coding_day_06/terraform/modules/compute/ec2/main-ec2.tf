resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name = aws_key_pair.ec2_keypair.id

  tags = merge(
                var.tags, 
                tomap(
                    {
                      "Name" = "ec2_${var.tags.RegionShortName}_${var.tags.ApplicationName}_${var.tags.Environment}_${var.instance_name_suffix}"
                    }                      
                  )                      
              )
}