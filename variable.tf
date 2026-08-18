variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "SGname" {
  default = "SGname"

}

variable "ami_id" {
  default = "ami-0bdc7d025135d7b49"

}

variable "instancetype" {
  default = "t2.micro"

}

