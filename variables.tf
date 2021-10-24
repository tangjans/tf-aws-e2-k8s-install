variable "aws_region" {
  description = "The AWS region to use"
  default     = "us-east-1"
}

variable "key_name" {
  default = "k8s"
}

variable "tag_name" {
  description = "The name to tag AWS resources with"
  default     = "k8s"
}

variable "cidr_block" {
  description = "The CIDR block range to use for the OpenVPN VPC"
  default     = "10.0.0.0/16"
}

variable "ssh_public_key_file" {
  # Generate via 'ssh-keygen -f openvpn -t rsa'
  description = "The public SSH key to store in the EC2 instance"
  default     = "settings/openvpn.pub"
}

variable "ssh_private_key_file" {
  # Generate via 'ssh-keygen -f openvpn -t rsa'
  description = "The private SSH key used to connect to the EC2 instance"
  default     = "settings/openvpn"
}
variable "instance_root_block_device_volume_size" {
  description = "The size of the root block device volume of the EC2 instance in GiB"
  default     = 8
}
