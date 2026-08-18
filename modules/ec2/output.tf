output "subnet_id" {
  value = var.subnet_id
}

output "instance_id" {
  value = aws_instance.MyEC2.id
}