data "aws_availability_zones" "availability_zones" {
  state = "available"
}


resource "aws_vpc_ipam_pool_cidr_allocation" "main_public_subnets_cidr_allocations" {
  count = length(data.aws_availability_zones.availability_zones.names)

  ipam_pool_id   = var.ipam_pool_id
  netmask_length = 28
}

resource "aws_vpc_ipam_pool_cidr_allocation" "main_private_subnets_cidr_allocations" {
  count = length(data.aws_availability_zones.availability_zones.names)

  ipam_pool_id   = var.ipam_pool_id
  netmask_length = 28
}

resource "aws_subnet" "main_public_subnets" {
  count             = length(data.aws_availability_zones.availability_zones.names)
  vpc_id            = aws_vpc.shared_vpc.id
  cidr_block        = aws_vpc_ipam_pool_cidr_allocation.main_public_subnets_cidr_allocations[count.index].cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]

  tags = {
    Name = "main-public-${data.aws_availability_zones.availability_zones.names[count.index]}"
    type = "public"
    az   = data.aws_availability_zones.availability_zones.names[count.index]
  }
}

resource "aws_subnet" "main_private_subnets" {
  count             = length(data.aws_availability_zones.availability_zones.names)
  vpc_id            = aws_vpc.shared_vpc.id
  cidr_block        = aws_vpc_ipam_pool_cidr_allocation.main_private_subnets_cidr_allocations[count.index].cidr
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]

  tags = {
    Name = "main-private-${data.aws_availability_zones.availability_zones.names[count.index]}"
    type = "private"
    az   = data.aws_availability_zones.availability_zones.names[count.index]
  }
}
