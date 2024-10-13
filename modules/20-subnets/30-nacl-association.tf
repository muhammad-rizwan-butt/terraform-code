resource "aws_network_acl_association" "nacl_associations" {
  depends_on = [
    aws_subnet.subnets
  ]
  count = length(var.subnet_data)

  network_acl_id = var.subnet_data[count.index].type == "private" ? var.private_nacl_id : var.public_nacl_id
  subnet_id      = aws_subnet.subnets[count.index].id
}
