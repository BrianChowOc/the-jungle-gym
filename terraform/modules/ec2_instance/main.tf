# Crée un security group avec des règles d'entrée dynamiques
resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  # Règles d’entrée passées sous forme de liste d’objets
  dynamic "ingress" {
    for_each = var.ingress_rules                       
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # Règle de sortie par défaut : tout est autorisé
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

# Crée une instance EC2 dans le subnet spécifié
resource "aws_instance" "ec2" {
  ami                    = var.ami_id                   
  instance_type          = var.instance_type            
  subnet_id              = var.subnet_id
  key_name               = var.key_name                
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  
  tags = {
    Name = var.instance_name
  }
}