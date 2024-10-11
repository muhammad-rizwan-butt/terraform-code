output "vpc_id" {
  value       = aws_vpc.shared_vpc.id
  description = "shared_vpc ID"
}

output "public_nacl_id" {
  value       = aws_network_acl.public_nacl.id
  description = "public NACL ID"
}

output "private_nacl_id" {
  value       = aws_network_acl.private_nacl.id
  description = "private NACL ID"
}

output "public_route_table_id" {
  value       = aws_route_table.public_route_table.id
  description = "public route table ID"
}

output "private_route_table_id" {
  value       = aws_route_table.private_route_table.id
  description = "private route table ID"
}
