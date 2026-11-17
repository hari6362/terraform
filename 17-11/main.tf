
resource "aws_instance" "ec2" {
  count         = 4
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.sg[count.index].id,
    aws_security_group.common.id
  ]

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }

lifecycle {
    create_before_destroy = true
  }

}

resource "aws_security_group" "sg" {
  count = 4

  name = "${var.project}-${var.environment}-${var.instances[count.index]}"

  egress {
    
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }

}

resource "aws_security_group" "common" {

  name = "${var.project}-${var.environment}-common"      

  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }


  ingress {                                 # mention required ips
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "${var.project}-${var.environment}-common"
  }

  
}


