variable "vpc_id" {
  description = "ID du VPC partagé"
  type        = string
}

variable "route_table_id" {
  description = "ID de la route table publique partagée"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR du subnet à créer"
  type        = string
}

variable "availability_zone" {
  description = "Zone de disponibilité"
  type        = string
}

variable "name_suffix" {
  description = "Suffixe pour nommer les ressources"
  type        = string
}
