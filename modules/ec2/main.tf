resource "aws_instance" "MyEC2" {
    ami = var.ami_id
    instance_type = var.instancetype
    subnet_id = aws_subnet.mypublic1.id
    vpc_security_group_ids = ["aws_security_group."]
    tags = {
        Name = "Yamahaec2"
    }
  
}

