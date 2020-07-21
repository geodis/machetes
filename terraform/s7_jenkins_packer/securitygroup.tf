resource "aws_security_group" "jenkins-securitygroup" {
  name = "jenkins-securitygroup"
  vpc_id = aws_vpc.main.id
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["200.59.126.59/32"]
  }
  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["200.59.126.59/32"]
  }
  tags = {
    Name = "jenkins-securitygroup"
  }
}

resource "aws_security_group" "app-securitygroup" {
  name = "app-securitygroup"
  vpc_id = aws_vpc.main.id

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["200.59.126.59/32"]
  }
  tags = {
    Name = "app-securitygroup"
  }
}