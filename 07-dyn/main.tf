resource "aws_instance" "demo-instance" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_terraform.id] # list

  tags = {
    Name = "terraform Demo"
    project = "roboshop"
    Environment = "Dev"
  }

}



# It creates in default VPC
resource "aws_security_group" "allow_terraform" {
  name        = "allow_terraform_dynamic"
  description = "Allow TLS inbound traffic and all outbound traffic"

# outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # all traffic
    cidr_blocks      = ["0.0.0.0/0"]
     }

  dynamic "ingress" {
    for_each =  var.ingress_rules
    content {
        from_port        = ingress.value.port
        to_port          = ingress.value.port
        protocol         = "tcp" # all traffic
        cidr_blocks      = ingress.value.cidr_blocks
    }                              
    
  }



  tags = {
    Name = "allow_terraform"
  }
}

