# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-db-subnet-group"
  }
}

# Primary RDS Instance
resource "aws_db_instance" "primary" {
  identifier     = "${var.project_name}-${var.environment}-db-primary"
  engine         = "mysql"
  engine_version = "8.0"

  instance_class    = var.db_instance_class
  allocated_storage = 20
  storage_type      = "gp2"
  storage_encrypted = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.db_sg_id]

  availability_zone = var.availability_zones[0]
  multi_az          = false

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  skip_final_snapshot = true

  tags = {
    Name = "${var.project_name}-${var.environment}-db-primary"
  }
}

# Read Replica
resource "aws_db_instance" "replica" {
  identifier          = "${var.project_name}-${var.environment}-db-replica"
  replicate_source_db = aws_db_instance.primary.identifier

  instance_class = var.db_instance_class

  availability_zone = var.availability_zones[1]

  skip_final_snapshot = true

  tags = {
    Name = "${var.project_name}-${var.environment}-db-replica"
  }
}