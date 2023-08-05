provider "aws" {
  region = "eu-west-2"
  
}

resource "aws_instance" "demo-server" {
    ami = "ami-05b5a865c3579bbc4"
    instance_type = "t3.micro"
    key_name = "demo"
    security_groups = ["demo-sg"]
}
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-port"
  }
}