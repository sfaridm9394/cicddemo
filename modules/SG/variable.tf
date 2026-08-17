variable "SGname" {
  type    = string
  default = "MyVPCSG"
}

variable "cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "vpc_id" {
  type = string
  
}