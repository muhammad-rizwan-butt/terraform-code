resource "aws_subnet" "subnets_1a" {
  depends_on = [
    aws_vpc_ipam_pool_cidr_allocation.cidr_allocations_1a
  ]
  count             = length(var.subnet_data)
  vpc_id            = var.vpc_id
  cidr_block        = aws_vpc_ipam_pool_cidr_allocation.cidr_allocations_1a[count.index].cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[0]

  tags = {
    Name = "${var.subnet_data[count.index].name}-1a"
    type = var.subnet_data[count.index].type
    az   = data.aws_availability_zones.availability_zones.names[0]
  }
}

resource "aws_subnet" "subnets_1b" {
  depends_on = [
    aws_vpc_ipam_pool_cidr_allocation.cidr_allocations_1b
  ]
  count             = length(var.subnet_data)
  vpc_id            = var.vpc_id
  cidr_block        = aws_vpc_ipam_pool_cidr_allocation.cidr_allocations_1b[count.index].cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[1]

  tags = {
    Name = "${var.subnet_data[count.index].name}-1b"
    type = var.subnet_data[count.index].type
    az   = data.aws_availability_zones.availability_zones.names[1]
  }
}

resource "aws_subnet" "subnets_1c" {
  depends_on = [
    aws_vpc_ipam_pool_cidr_allocation.cidr_allocations_1c
  ]
  count             = length(var.subnet_data)
  vpc_id            = var.vpc_id
  cidr_block        = aws_vpc_ipam_pool_cidr_allocation.cidr_allocations_1c[count.index].cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[2]

  tags = {
    Name = "${var.subnet_data[count.index].name}-1c"
    type = var.subnet_data[count.index].type
    az   = data.aws_availability_zones.availability_zones.names[2]
  }
}
