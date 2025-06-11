# =====================================
# Fichier backend.tf de prod
# ➔ Configuration du backend pour stocker l'état de Terraform dans un bucket S3 de l'environnement PROD
# =====================================

terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "terraform-jungle-gym-fr"
    key    = "state/prod-k3s/terraform.tfstate" 
    region = "eu-west-3"
    encrypt = true
  }
}