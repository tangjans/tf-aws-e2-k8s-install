

resource "null_resource" "k8s_join_token" {
  depends_on = [
    null_resource.k8s_bootstrap_master,aws_key_pair.k8s
  ]
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
      "kubeadm token create --print-join-command > /tmp/kubeadm.txt"
    ]
  }
}

resource "null_resource" "get_kubeadm-txt" {
  depends_on = [
    null_resource.k8s_join_token,
  ]
  
  provisioner "local-exec" {
    command = "scp -i k8s.pem ${var.ec2_username}@${aws_instance.k8s_cp.public_ip}:/tmp/kubeadm.txt /tmp/kubeadm.txt && scp -i k8s.pem ${var.ec2_username}@${aws_instance.k8s_cp.public_ip}:~/.kube/config kubeconfig"
    
  }
}

resource "null_resource" "put_kubeadm_worker" {
  depends_on = [
    null_resource.get_kubeadm-txt,
  ]
  
  provisioner "local-exec" {
    command = "scp -i k8s.pem /tmp/kubeadm.txt ${var.ec2_username}@${aws_instance.k8s_worker.public_ip}:/tmp"

  }
}

resource "null_resource" "k8s_worker_join_cluster" {
  depends_on = [
    null_resource.put_kubeadm_worker,
  ]
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
      "sudo `cat /tmp/kubeadm.txt`"
    ]
  }
}