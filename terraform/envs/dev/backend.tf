# =====================================
# Fichier backend.tf de dev
# ➔ Configuration du backend pour stocker l'état de Terraform dans un bucket S3 de l'environnement DEV
# =====================================

terraform {
  backend "s3" {
    bucket = "terraform-state-166342213294"
    key    = "state/dev-k3s/terraform.tfstate" 
    region = "eu-west-3"
    encrypt = true
  }
}