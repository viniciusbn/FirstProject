output "instance_ip_addr" {
  value       = aws_instance.FirstProject.public_ip
  description = "The public IP address of the main server instance."
}

output "instance_public_dns" {
  value       = aws_instance.FirstProject.public_dns
  description = "The public DNS name of the main server instance."
}

output "private_key" {
  value     = tls_private_key.pk.private_key_pem
  sensitive = true
}