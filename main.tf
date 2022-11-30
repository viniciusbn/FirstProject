resource "tls_private_key" "FirstProject_PK" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "FirstProject_KP" {
  key_name   = "FirstProject_KP"
  public_key = tls_private_key.FirstProject_PK.public_key_openssh
}



# An example resource that does nothing.
resource "aws_instance" "FirstProject" {
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.FirstProject_KP.key_name
  security_groups             = [aws_security_group.FirstProject_SG.name]
  associate_public_ip_address = true
  user_data                   = <<-EOF
#!/bin/bash
set -ex
sudo apt update && sudo apt install docker.io -y
sudo docker run -d -p 3000:3000 vbnascimento/firstproject
EOF
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