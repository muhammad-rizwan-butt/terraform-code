resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.shared_vpc.id

  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.shared_vpc.id

  tags = {
    Name = "public_route_table"
  }
}
