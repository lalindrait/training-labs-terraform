resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr_ranges)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_ranges[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    tomap(
      {
        "Name"         = "subnet_${var.tags.RegionShortName}__${var.tags.ApplicationName}_${var.tags.Environment}_public_${substr(var.azs[count.index], -2, -1)}",
        "ResourceType" = "Subnet"
      }
    )
  )

}

resource "aws_subnet" "private_subnet" {
  count = length(var.public_subnet_cidr_ranges)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_ranges[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.tags,
    tomap(
      {
        "Name"         = "subnet_${var.tags.RegionShortName}__${var.tags.ApplicationName}_${var.tags.Environment}_private_${substr(var.azs[count.index], -2, -1)}",
        "ResourceType" = "Subnet"
      }
    )
  )

}