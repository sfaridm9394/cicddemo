module "VPC" {
  source   = "git::https://github.com/sfaridm9394/cicddemo.git//modules/VPC?ref=dev"
  cidr1    = "10.0.0.0/16"
  cidr2    = ["10.0.1.0/24"]
  cidr3    = ["10.0.2.0/24"]
  cidr6    = "0.0.0.0/0"
  myaz     = ["us-west-2a"]
  vpcname  = "myvpc"
  pubsub1  = "mypublic1"
  privsub1 = "myprivate1"
}

module "SG" {
  source = "git::https://github.com/sfaridm9394/cicddemo.git//modules/SG?ref=dev"

  vpc_id     = var.vpc_id
  SGname     = var.SGname
  cidr_block = var.cidr_block
}

module "ec2" {
  source = "git::https://github.com/sfaridm9394/cicddemo.git//modules/ec2?ref=dev"

  ami_id            = var.ami_id
  instancetype      = var.instancetype
  subnet_id         = module.VPC.public_subnet_id
  security_group_id = module.SG.MyVPCSG_id
}