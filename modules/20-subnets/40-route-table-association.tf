resource "aws_route_table_association" "route_table_associations_1a" {
  depends_on = [
    aws_subnet.subnets_1a
  ]
  count          = length(var.subnet_data)
  subnet_id      = aws_subnet.subnets_1a[count.index].id
  route_table_id = var.subnet_data[count.index].type == "public" ? var.public_route_table_id : var.private_route_table_id[0]
}

resource "aws_route_table_association" "route_table_associations_1b" {
  depends_on = [
    aws_subnet.subnets_1b
  ]
  count          = length(var.subnet_data)
  subnet_id      = aws_subnet.subnets_1b[count.index].id
  route_table_id = var.subnet_data[count.index].type == "public" ? var.public_route_table_id : var.private_route_table_id[1]
}

resource "aws_route_table_association" "route_table_associations_1c" {
  depends_on = [
    aws_subnet.subnets_1c
  ]
  count          = length(var.subnet_data)
  subnet_id      = aws_subnet.subnets_1c[count.index].id
  route_table_id = var.subnet_data[count.index].type == "public" ? var.public_route_table_id : var.private_route_table_id[2]
}
