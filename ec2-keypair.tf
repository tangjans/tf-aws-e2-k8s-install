resource "tls_private_key" "k8s_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "k8s" {
  key_name   = var.key_name
  public_key = tls_private_key.k8s_private_key.public_key_openssh

  provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
    command = <<-EOT
      echo '${tls_private_key.k8s_private_key.private_key_pem}' > ./'${var.key_name}'.pem
      chmod 400 ./'${var.key_name}'.pem
    EOT
  }

  provisioner "local-exec" {
    when = destroy
    command= "rm -f ./k8s.pem && rm -f ./kubeconfig"
  }

}