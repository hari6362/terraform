resource "aws_instance" "terraform_demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_terraform.id] # braces identify if list 
  tags = {
    Name        = "terraform Demo"
    Project     = "roboshop"
    Environment = "dev"
  }
}

# it will creates in defaults vpc
resource "aws_security_group" "allow_terraform" {
  name        = "allow_terraform"
  description = "Allow TLS inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # all trafic
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }



  tags = {
    Name = "allow_terraform"
  }
}
