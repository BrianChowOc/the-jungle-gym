variable "environment" {}
variable "instance_class" { default = "db.t2.micro" }
variable "storage"        { default = 20 }
variable "db_name"        {}
variable "username"       {}
variable "password"       {}
variable "security_group_id" {}
variable "db_subnet_group_name" {}
