resource "aws_security_group" "pg_to_k8s-cluster" {
  name        = "pg_to_k8s-cluster"
  description = "pg_to_k8s-cluster"

  vpc_id = aws_vpc.k8s.id

  tags = {
    Name        = var.tag_name
    Provisioner = "Terraform"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}