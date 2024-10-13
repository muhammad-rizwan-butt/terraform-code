resource "aws_subnet" "subnets" {
  depends_on = [
    aws_vpc_ipam_pool_cidr_allocation.cidr_allocations
  ]
  count             = length(var.subnet_data)
  vpc_id            = var.vpc_id
  cidr_block        = aws_vpc_ipam_pool_cidr_allocation.cidr_allocations[count.index].cidr
  availability_zone = var.subnet_data[count.index].az

  tags = {
    Name = var.subnet_data[count.index].name
    type = var.subnet_data[count.index].type
    az   = var.subnet_data[count.index].az
  }
}
