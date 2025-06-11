variable "ami_id" {
  type = string
  description = "AMI pour l'instance EC2"
}
variable "instance_type" {
  type = string
  description = "Type d'instance EC2"
}
variable "subnet_id" {
  type = string
  description = "ID du subnet pour l'instance EC2"
}
variable "key_name" {
  type = string
  description = "Nom de la clé SSH"
}
variable "vpc_id" {
  type = string
  description = "ID du VPC existant"
}
variable "instance_name" {
  type = string
  description = "Nom de l'instance EC2"
}
variable "security_group_name" {
  type = string
  description = "Nom du groupe de sécurité"
}
variable "security_group_description" {
  type = string
  description = "Description du groupe de sécurité"
}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
