resource "aws_security_group" "security_group_internet_access" {
  name   = "sg_allow_internet"
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.tags,
    tomap(
      {
        "Name"         = "sg_${var.tags.RegionShortName}_${var.tags.ApplicationName}_${var.tags.Environment}_allow_internet_traffic"
        "ResourceType" = "SecurityGroup"
      }
    )
  )

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}