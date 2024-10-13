resource "aws_route_table_association" "route_table_associations" {
  depends_on = [
    aws_subnet.subnets
  ]
  count          = length(var.subnet_data)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = var.subnet_data[count.index].type == "private" ? var.private_route_table_id : var.public_route_table_id
}
