public_subnet_cidr = "10.0.1.0/24"
availability_zone = "eu-west-3a"
name_suffix = "dev"
instance_type = "t3.medium"
key_name = "my-ssh-key"
instance_name = "k3s-dev-instance"
security_group_name = "k3s-dev-sg"
security_group_description = "Security group for K3s DEV instanc"
ingress_rules = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["88.123.184.76/32"]
  },
  {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["88.123.184.76/32"] 
  }
]
