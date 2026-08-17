variable "vpcname" {
    default = "yamahavpc"
  
}
variable "cidr1" {
    default = "10.0.0.0/16"
}

variable "cidr2" {
    type = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"] 
}


variable "cidr3" {
    type = list(string)
    default = ["10.0.4.0/24","10.0.5.0/24"] 
}



variable "cidr6" {
    default = "0.0.0.0/0"
}

variable "myaz" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
}

variable "pubsub1" {
    default = "mypublicsubnet1"
}

variable "privsub1" {
    default = "myprivatesubnet1"
}

variable "az1" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
}