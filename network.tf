resource "aws_security_group" "instance" {
  name = "terraform-test-instance"

  ingress{
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
 default = true
}

data "aws_subnet_ids" "default" {
 vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group" "alb" {
  name = "terraform-test-alb"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
