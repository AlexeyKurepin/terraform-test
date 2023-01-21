provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"
  tags = {
    Name = "webserver"
  }
}
