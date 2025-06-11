# =====================================
# Fichier main.tf de l'environnement DEV
# ➔ Définition de l'infrastructure réseau et serveur web
# ➔ Utilisation d'un VPC partagé via remote state
# ➔ Création d'un subnet public et d'un serveur web
# =====================================

# Data source pour récupérer l'état distant du VPC partagé
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-state-166342213294"
    key    = "state/shared/vpc/terraform.tfstate"
    region = "eu-west-3"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

module "subnet_k3s_dev" {
  source              = "../../modules/subnet"
  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  route_table_id      = data.terraform_remote_state.vpc.outputs.public_route_table_id
  public_subnet_cidr  = var.public_subnet_cidr
  availability_zone   = var.availability_zone
  name_suffix         = var.name_suffix 
}

module "ec2_k3s_dev" {
  source                     = "../../modules/ec2_instance"
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_id
  ami_id                     = data.aws_ami.ubuntu.id
  instance_type              = var.instance_type
  subnet_id                  = module.subnet_k3s_dev.public_subnet_id
  key_name                   = var.key_name
  instance_name              = var.instance_name
  ingress_rules              = var.ingress_rules
  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
}