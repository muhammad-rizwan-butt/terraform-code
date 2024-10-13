resource "aws_route" "public_route_igw" {
  depends_on = [
    aws_internet_gateway.igw
  ]

  route_table_id         = var.public_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# resource "aws_route" "private_route_ngw" {
#     depends_on = [ 
#         aws_nat_gateway.ngw
#      ]
#     count = length(aws_nat_gateway.ngw)

#      route_table_id = var.private_route_table_id
#      destination_cidr_block = "0.0.0.0/0"
#      nat_gateway_id = 
# }
