resource "aws_security_group" "ec2-sg" {
  name = "my-ec2-sg"


  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow inbound ports"
    from_port = local.app_port
    protocol = "tcp"
    to_port = local.app_port
  } 

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    protocol = "-1"
    to_port = 0
  } 
}

# resource "aws_security_group" "elb-sg" {
#   name = "myelb-sg"

#   ingress {
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "allow inbound ports"
#     from_port = local.app_port
#     protocol = "tcp"
#     to_port = local.app_port
#   } 

#   egress {
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port = 0
#     protocol = "-1"
#     to_port = 0
#   } 
# }

locals {
  app_port = "8443"
}

output "mysg" {
  value = "${aws_security_group.ec2-sg.id}"
}