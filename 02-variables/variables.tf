variable "ami_id" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "EC2 instance type for the web server"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small"], var.instance_type)
    error_message = "Instance type should be either t3.micro or t3.small"
  }

}


variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "terraform Demo"
    project     = "roboshop"
    Environment = "Dev"
  }
}



variable "sg_name" {
  type    = string
  default = "allow_terraform"

}


variable "port" {
  type    = number
  default = 0
}

# variable "cidr" {
#   type    = list(string)
#   default = ["0.0.0.0/0"]
# }

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name = "allow_terraform"
  }

}