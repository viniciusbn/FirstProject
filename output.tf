output "instance_ip_addr" {
  value       = aws_instance.FirstProject.public_ip
  description = "The public IP address of the main server instance."
}

output "instance_public_dns" {
  value       = aws_instance.FirstProject.public_dns
  description = "The public DNS name of the main server instance."
}

#output "private_key_pem" {
#  value     = tls_private_key.FirstProject_PK.private_key_pem
#  sensitive = true
#}

#output "private_key_openssh" {
#  value     = tls_private_key.FirstProject_PK.private_key_openssh
#  sensitive = true
#}

#output "private_key_pkcs8" {
#  value     = tls_private_key.FirstProject_PK.private_key_pem_pkcs8
#  sensitive = true
#}

#output "public_key_pem" {
#  value     = tls_private_key.FirstProject_PK.public_key_pem
#  sensitive = true
#}

#output "public_key_openssh" {
#  value     = tls_private_key.FirstProject_PK.public_key_openssh
#  sensitive = true
#}

#output "public_key_sha256" {
#  value     = tls_private_key.FirstProject_PK.public_key_fingerprint_sha256
#  sensitive = true
#}