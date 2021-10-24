variable "ec2_username" {
  description = "The user to connect to the EC2 as"
  default     = "ubuntu"
}

variable "instance_type" {
  description = "The instance type to use"
  default     = "t2.medium"
}

variable "instance_count" {
  default = "1"
}

resource "aws_instance" "k8s_cp" {
  //ami                         = data.aws_ami.amazon_linux_2.id
  //count                       = var.instance_count
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.k8s.key_name
  subnet_id                   = aws_subnet.k8s.id
  //user_data                   = file("${path.module}/scripts/k8-install.sh")


  vpc_security_group_ids = [
    aws_security_group.pg_to_k8s-cluster.id,
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.instance_root_block_device_volume_size
    delete_on_termination = true
  }

  tags = {
    Name        = var.tag_name
    Provisioner = "Terraform"
  }
}

resource "aws_instance" "k8s_worker" {
  //ami                         = data.aws_ami.amazon_linux_2.id
  //count                       = var.instance_count
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.k8s.key_name
  subnet_id                   = aws_subnet.k8s.id
  //user_data                   = file("${path.module}/scripts/k8-install.sh")


vpc_security_group_ids = [
    aws_security_group.pg_to_k8s-cluster.id,
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.instance_root_block_device_volume_size
    delete_on_termination = true
  }

  tags = {
    Name        = var.tag_name
    Provisioner = "Terraform"
  }
}
