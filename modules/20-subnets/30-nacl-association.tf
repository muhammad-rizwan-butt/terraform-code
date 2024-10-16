resource "aws_network_acl_association" "nacl_associations_1a" {
  depends_on = [
    aws_subnet.subnets_1a
  ]
  count = length(var.subnet_data)

  network_acl_id = var.subnet_data[count.index].type == "private" ? var.private_nacl_id : var.public_nacl_id
  subnet_id      = aws_subnet.subnets_1a[count.index].id
}

resource "aws_network_acl_association" "nacl_associations_1b" {
  depends_on = [
    aws_subnet.subnets_1b
  ]
  count = length(var.subnet_data)

  network_acl_id = var.subnet_data[count.index].type == "private" ? var.private_nacl_id : var.public_nacl_id
  subnet_id      = aws_subnet.subnets_1b[count.index].id
}

resource "aws_network_acl_association" "nacl_associations_1c" {
  depends_on = [
    aws_subnet.subnets_1c
  ]
  count = length(var.subnet_data)

  network_acl_id = var.subnet_data[count.index].type == "private" ? var.private_nacl_id : var.public_nacl_id
  subnet_id      = aws_subnet.subnets_1c[count.index].id
}
