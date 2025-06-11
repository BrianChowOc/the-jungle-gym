# =====================================
# Fichier main.tf - Environnement SHARED/VPC
# ➔ Crée uniquement les ressources réseau partagées
# =====================================

# VPC principal partagé
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "shared-vpc"
    Env  = "shared"
  }
}

# Internet Gateway pour l'accès Internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "shared-igw"
  }
}

# Route table publique
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "shared-public-rt"
  }
}
