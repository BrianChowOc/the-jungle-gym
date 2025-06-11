resource "aws_db_instance" "db" {
  identifier        = "db-${var.environment}"
  engine            = "mysql"
  instance_class    = var.instance_class
  allocated_storage = var.storage
  name              = var.db_name
  username          = var.username
  password          = var.password
  skip_final_snapshot = true
  publicly_accessible = false
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = var.db_subnet_group_name

  tags = {
    Name = "db-${var.environment}"
  }
}
