# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "vinibackes"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "vinibackes_lab"
    }
  }
}

##PROVIDER 
provider "aws" {
  region     = "us-east-1"
#  access_key = ${{ secrets.AWS_ACCESS_KEY_ID }}
#  secret_key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
}

variable "key_name" {}

resource "tls_private_key" "FirstProjectKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.FirstProjectKey.public_key_openssh
}

# An example resource that does nothing.
resource "aws_instance" "FirstProject" {
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.generated_key.key_name
  security_groups             = aws_security_group.FirstProject_SG.name
  associate_public_ip_address = true
  tags = {
    Name = "FirstProject"
  }
}

#Security groups parameters
resource "aws_security_group" "FirstProject_SG" {
  name        = "FirstProject_SG"
  description = "Allow Access TCP/3000 & TCP/22"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP_3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "FirstProject_SG"
  }
}