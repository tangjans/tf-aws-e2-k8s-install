resource "aws_vpc" "k8s" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = var.tag_name
    Provisioner = "Terraform"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.k8s.id}"
}

resource "aws_route" "simulation_default_route" {
  route_table_id         = "${aws_vpc.k8s.default_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.ig.id}"
}

resource "aws_subnet" "k8s" {
  vpc_id     = aws_vpc.k8s.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 0)

  tags = {
    Name        = var.tag_name
    Provisioner = "Terraform"
  }
}