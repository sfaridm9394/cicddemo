module "VPC" {
    source = "./modules/vpc"
    cidr1 = "10.0.0.0/16"
    cidr2 = ["10.0.1.0/24"]
    cidr3 = ["10.0.2.0/24"]
    cidr6 = "0.0.0.0/0"
    myaz = ["us-west-2a"]
    vpcname = "myvpc"
    pubsub1 = "mypublic1"
    privsub1 = "myprivate1"
}