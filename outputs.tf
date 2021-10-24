output "public_ip_k8s-master" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = element(concat(aws_instance.k8s_cp.*.public_ip, aws_instance.k8s_cp.*.public_ip, [""]), 0)
}

output "public_ip_k8s-worker" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = element(concat(aws_instance.k8s_worker.*.public_ip, aws_instance.k8s_worker.*.public_ip, [""]), 0)
}