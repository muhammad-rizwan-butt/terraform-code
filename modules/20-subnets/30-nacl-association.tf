resource "aws_network_acl_association" "nacl_associations" {
  count = length(var.subnet_data)

  network_acl_id = var.subnet_data[count.index].type == "private" ? var.private_nacl_id : var.public_nacl_id
  subnet_id      = aws_subnet.subnets[count.index].id
}
