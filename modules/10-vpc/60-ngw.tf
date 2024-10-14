resource "aws_eip" "ngw_ips" {
  count  = length(data.aws_availability_zones.availability_zones.names)
  domain = "vpc"
}

resource "aws_nat_gateway" "ngw" {
  count = length(data.aws_availability_zones.availability_zones.names)

  subnet_id     = aws_subnet.main_public_subnets[count.index].id
  allocation_id = aws_eip.ngw_ips[count.index].id

}
