provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myinstance" {
  ami = "ami-0464d49b8794eba32"
  instance_type = var.instance_type
}