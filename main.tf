variable "tags" {
  description = "Dynamic tags"
  type        = map(string)
  default = {
    "Name" = "FirstProject"
    "Terraform" = "true"
  }
}
resource "aws_instance" "FirstProject" {
  ami                         = data.aws_ami.ubuntu
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.FirstProject_KP.key_name
  security_groups             = [aws_security_group.FirstProject_SG.name]
  associate_public_ip_address = true
  user_data                   = file("DeployApp.sh")

  dynamic "tags" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
    }
  }
}