# =====================================
# Fichier versions.tf
# ➔ Définition des versions requises pour Terraform et les providers
# ➔ Utilisation du provider AWS version 5.x
# ➔ Version minimale de Terraform : 1.3.0
# =====================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}
