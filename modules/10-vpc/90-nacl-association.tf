resource "aws_network_acl_association" "main_public_nacl_associations" {
  depends_on = [
    aws_subnet.main_public_subnets
  ]
  count = length(data.aws_availability_zones.availability_zones.names)

  network_acl_id = aws_network_acl.public_nacl.id
  subnet_id      = aws_subnet.main_public_subnets[count.index].id
}

resource "aws_network_acl_association" "main_private_nacl_associations" {
  depends_on = [
    aws_subnet.main_private_subnets
  ]
  count = length(data.aws_availability_zones.availability_zones.names)

  network_acl_id = aws_network_acl.private_nacl.id
  subnet_id      = aws_subnet.main_private_subnets[count.index].id
}
