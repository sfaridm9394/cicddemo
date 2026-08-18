resource "aws_instance" "MyEC2" {
  ami           = var.ami_id
  instance_type = var.instancetype

  subnet_id = var.subnet_id

  vpc_security_group_ids = [var.security_group_id]
}