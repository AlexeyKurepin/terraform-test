provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami                    = "ami-0778521d914d23bc1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  user_data              = <<-EOF
    #!/bin/bash
    echo "Hello World" > index.html
    nohup busybox httpd -f -p ${var.port} &
    EOF
  tags = {
    Name = "webserver"
  }
}

resource "aws_security_group" "webserver-sg" {
  name        = "webserver-sg"
  description = "Optional"
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
