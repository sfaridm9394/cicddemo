output "vpc_id" {
    value = aws_vpc.myvpc.id
}

output "public_subnet_id" {
    value = aws_subnet.mypublic1.id
}

output "private_subnet_id" {
    value = aws_subnet.myprivate1.id
}

