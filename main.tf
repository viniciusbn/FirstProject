# An example resource
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