output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_route_table_id" {
  value = aws_route_table.public_rt.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}