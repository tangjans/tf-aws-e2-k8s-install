

resource "null_resource" "k8s_bootstrap_master" {
  connection {
    type        = "ssh"
    host        = aws_instance.k8s_cp.public_ip
    user        = "ubuntu"
    port        = "22"
    private_key = tls_private_key.k8s_private_key.private_key_pem
    agent       = false
  }

  provisioner "remote-exec" {
    inline = [
      "sudo curl https://raw.githubusercontent.com/tangjans/tf-aws-e2-k8s-install/main/scripts/k8s-master.sh | sh"
    ]
  }
}

resource "null_resource" "k8s_bootstrap_worker" {
  connection {
    type        = "ssh"
    host        = aws_instance.k8s_worker.public_ip
    user        = "ubuntu"
    port        = "22"
    private_key = tls_private_key.k8s_private_key.private_key_pem
    agent       = false
  }

  provisioner "remote-exec" {
    inline = [
      "sudo curl https://raw.githubusercontent.com/tangjans/tf-aws-e2-k8s-install/main/scripts/k8s-worker.sh | sh"
    ]
  }
}

