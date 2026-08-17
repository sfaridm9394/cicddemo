output "subnet_id" {
    value = aws_subnet.mypublic1.id
}

output "instance_id" {
    value = aws_instance.MyEC2.id
}

output "instance_public_ip" {
    value = aws_instance.MyEC2.public_ip
}