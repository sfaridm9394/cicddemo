resource "aws_launch_template" "myLT"{
    image_id =  var.ami
    instance_type = var.instance
    name_prefix =  "MyLT"
    vpc_security_group_ids = [ "aws_security_group.MyVPCSG.id" ]
}


resource "aws_autoscaling_group" "MyASG" {
    desired_capacity = 3
    max_size = 2
    min_size = 1
    vpc_zone_identifier = []
    launch_template {
        id = aws_launch_template.myLT.id
        version = "$Latest"
    }
  
}