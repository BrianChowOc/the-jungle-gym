
variable public_subnet_cidr {
  description = "CIDR du subnet public partagé"
  type        = string
}
variable "availability_zone" {
  description = "Zone de disponibilité"
  type        = string
}
variable "name_suffix" {
  description = "Suffixe pour le nom de l'instance"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
}

variable "key_name" {
  description = "Nom de la clé SSH"
  type        = string
}

variable "instance_name" {
  description = "Nom de l'instance EC2"
  type        = string
}

variable "security_group_name" {
  description = "Nom du groupe de sécurité"
  type        = string
}
variable "security_group_description" {
  description = "Description du groupe de sécurité"
  type        = string
}
variable "ingress_rules" {
  description = "Règles d'entrée pour le groupe de sécurité"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}