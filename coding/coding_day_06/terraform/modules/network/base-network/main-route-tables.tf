resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    var.tags,
    tomap(
      {
        "Name"         = "rtb_${var.tags.RegionShortName}_${var.tags.ApplicationName}_public_${var.tags.Environment}"
        "ResourceType" = "RouteTable"
      }
    )
  )
}


resource "aws_route_table_association" "rtb_asc_public" {
  count = length(var.public_subnet_cidr_ranges)

  subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.rtb.id
}

