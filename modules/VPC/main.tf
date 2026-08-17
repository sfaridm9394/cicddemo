resource "aws_vpc" "myvpc" {
    cidr_block = var.cidr1
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = var.vpcname  
    }
}

resource "aws_subnet" "mypublic1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr2[0]
    availability_zone = var.myaz[0]
    map_public_ip_on_launch = true
    tags = {
        Name = var.pubsub1
    }
}

resource "aws_subnet" "myprivate1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr3[0]
    availability_zone = var.myaz[0]
    map_public_ip_on_launch = false
    tags = {
        Name = var.privsub1
    }
}

resource "aws_internet_gateway" "Myigw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "myinternetgateway"
    }
}
resource "aws_route_table" "MyRT1" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = var.cidr6
        gateway_id = aws_internet_gateway.Myigw.id
    }
  
}
resource "aws_route_table_association" "MyRTA1" {
    subnet_id = aws_subnet.mypublic1.id
    route_table_id = aws_route_table.MyRT1.id
}

resource "aws_eip" "MyEIP" {
    tags = {
        Name = "myeip"
    }   
}
resource "aws_nat_gateway" "MyNAT" {
    allocation_id = aws_eip.MyEIP.id
    subnet_id = aws_subnet.mypublic1.id
    tags = {
        Name = "mynatgateway"
    }
}

resource "aws_route_table" "MyRt2" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = var.cidr6
        gateway_id = aws_nat_gateway.MyNAT.id
    }
}

resource "aws_route_table_association" "MyRTA2" {
    subnet_id = aws_subnet.myprivate1.id
    route_table_id = aws_route_table.MyRt2.id
}

