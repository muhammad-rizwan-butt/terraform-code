data "aws_availability_zones" "availability_zones" {
  state = "available"
}

resource "aws_vpc_ipam_pool_cidr_allocation" "cidr_allocations_1a" {
  count = length(var.subnet_data)

  ipam_pool_id = var.ipam_pool_id
  netmask_length = var.subnet_data[count.index].subnet_size == "small" ? 28 : (
    var.subnet_data[count.index].subnet_size == "medium" ? 26 : 22
  )
}

resource "aws_vpc_ipam_pool_cidr_allocation" "cidr_allocations_1b" {
  count = length(var.subnet_data)

  ipam_pool_id = var.ipam_pool_id
  netmask_length = var.subnet_data[count.index].subnet_size == "small" ? 28 : (
    var.subnet_data[count.index].subnet_size == "medium" ? 26 : 22
  )
}

resource "aws_vpc_ipam_pool_cidr_allocation" "cidr_allocations_1c" {
  count = length(var.subnet_data)

  ipam_pool_id = var.ipam_pool_id
  netmask_length = var.subnet_data[count.index].subnet_size == "small" ? 28 : (
    var.subnet_data[count.index].subnet_size == "medium" ? 26 : 22
  )
}
