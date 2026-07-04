variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "rhel joindevops image"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small"], var.instance_type)
    error_message = "Instance type should be either t3.micro or t3.small"
  }

}