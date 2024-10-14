# resource "aws_route" "public_route" {
#   depends_on = [
#     aws_internet_gateway.igw
#   ]

#   route_table_id         = var.public_route_table_id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.igw.id
# }

# resource "aws_route" "private_routes" {
#     depends_on = [ 
#         aws_subnet.subnets
#      ]
#     count = length(var.subnet_data)

#      route_table_id = var.subnet_data[count.index].az == "eu-central-1a" ? var.private_route_table_id[0] : (
#       var.subnet_data[count.index].az == "eu=central-1b" ? var.private_route_table_id[1] : var.private_route_table_id[2]
#     )
#      destination_cidr_block = "0.0.0.0/0"
#      nat_gateway_id = ""
# }
