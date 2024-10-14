resource "aws_route" "main_public_route_igw" {
  depends_on = [
    aws_internet_gateway.igw
  ]

  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "main_private_route_ngw" {
  depends_on = [
    aws_nat_gateway.ngw
  ]
  count = length(data.aws_availability_zones.availability_zones.names)

  route_table_id         = aws_route_table.private_route_table[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw[count.index].id
}
