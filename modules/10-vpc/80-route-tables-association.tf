resource "aws_route_table_association" "main_public_route_table_associations" {
  depends_on = [
    aws_subnet.main_public_subnets
  ]
  count          = length(data.aws_availability_zones.availability_zones.names)
  subnet_id      = aws_subnet.main_public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "main_private_route_table_associations" {
  depends_on = [
    aws_subnet.main_private_subnets
  ]
  count          = length(data.aws_availability_zones.availability_zones.names)
  subnet_id      = aws_subnet.main_private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}
