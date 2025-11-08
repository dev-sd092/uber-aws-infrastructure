# Get latest Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# Backend EC2 Instances
resource "aws_instance" "backend" {
  count = length(var.private_subnet_ids)

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_ids[count.index]

  vpc_security_group_ids = [var.backend_sg_id]

  user_data = base64encode(templatefile("${path.root}/scripts/user-data-backend.sh", {
    db_endpoint = var.db_endpoint
  }))

  tags = {
    Name = "${var.project_name}-${var.environment}-backend-${count.index + 1}"
  }
}

# Attach to Target Group
resource "aws_lb_target_group_attachment" "backend" {
  count = length(aws_instance.backend)

  target_group_arn = var.target_group_arn
  target_id        = aws_instance.backend[count.index].id
  port             = 80
}