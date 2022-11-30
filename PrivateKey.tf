resource "tls_private_key" "FirstProject_PK" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "FirstProject_KP" {
  key_name   = "FirstProject_KP"
  public_key = tls_private_key.FirstProject_PK.public_key_openssh
}