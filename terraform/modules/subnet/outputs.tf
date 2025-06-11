output "public_subnet_id" {
  description = "ID du subnet public créé"
  value       = aws_subnet.public.id
}

output "subnet_cidr_block" {
  description = "CIDR block du subnet public"
  value       = aws_subnet.public.cidr_block
}

output "availability_zone" {
  description = "AZ utilisée pour le subnet public"
  value       = aws_subnet.public.availability_zone
}
