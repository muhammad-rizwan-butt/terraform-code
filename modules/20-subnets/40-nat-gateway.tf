data "aws_availability_zones" "availability_zones" {
  state = "available"
}

data "aws_subnets" "public_subnets_azs" {
  depends_on = [
    aws_subnet.subnets
  ]

  count = length(data.aws_availability_zones.availability_zones.names)

  filter {
    name   = "tag:type"
    values = ["public"]
  }

  filter {
    name   = "tag:az"
    values = [data.aws_availability_zones.availability_zones.names[count.index]]
  }
}

# locals {
#     public_subnets_per_az = [for subnet in data.aws_subnets.public_subnets_azs[*].ids : subnet if length(subnet) > 0 ]
# }

# resource "aws_eip" "ngw_ips" {
#   count  = length(data.aws_availability_zones.availability_zones.names)
#   domain = "vpc"
# }

# resource "aws_nat_gateway" "ngw" {
#   count = length(data.aws_availability_zones.availability_zones.names)

#   subnet_id = data.aws_subnets.public_subnets_azs[*].ids[count.index][0]
#   # subnet_id     = [for subnet in data.aws_subnets.public_subnets_azs[*].ids : subnet if length(subnet) > 0][count.index][0]
#   allocation_id = aws_eip.ngw_ips[count.index].id

# }

output "subnets" {
  # count = length(data.aws_availability_zones.availability_zones.names)
  # for subnet_list in var.subnets : subnet_list if length(subnet_list) > 0]
  #   value = length(data.aws_subnets.public_subnets_azs[*].ids)
  # value = [for subnet in data.aws_subnets.public_subnets_azs[*].ids : subnet if length(subnet) > 0]
  value = data.aws_subnets.public_subnets_azs[*].ids[0]
}