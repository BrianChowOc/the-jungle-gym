# =====================================
# Configuration du backend S3 pour Terraform
# ➔ Stockage de l'état Terraform dans un bucket S3
# ➔ Utilisation de l'encryption et de la région eu-west-3
# =====================================

terraform {
  backend "s3" {
    bucket = "terraform-state-166342213294"
    key    = "state/shared/vpc/terraform.tfstate"
    region = "eu-west-3"
    encrypt = true
  }
}
