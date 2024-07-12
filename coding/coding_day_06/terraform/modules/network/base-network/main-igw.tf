resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.tags,
    tomap(
      {
        "Name"         = "igw_${var.tags.RegionShortName}_${var.tags.ApplicationName}_${var.tags.Environment}"
        "ResourceType" = "InternetGateway"
      }
    )
  )
}