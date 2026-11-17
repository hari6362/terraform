variable "ami_id" {
  default = "ami-0055977a6e828a4f4"

}

# variable "ec2_tags" {
#     default = {
#         Name = "new-ec2"
#         project = "roboshop"
#         Environment = "dev"
#     }

# }

variable "port" {
  default = 0
}

variable "cidr" {
  default = ["0.0.0.0/0"]
}

variable "instance_type" {
  default = "t3.micro"
}


variable "environment" {
  default = "dev"

}

variable "instances" {
  default = ["mongodb", "redis", "mysql", "rabbitmq"]
  type    = list(any)
}


variable "project" {
  default = "nike"
  type    = string

}