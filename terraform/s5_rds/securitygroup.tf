resource "aws_security_group" "allow-ssh" {
  vpc_id = aws_vpc.main.id
  name = "allow-ssh"
  description = "allow-ssh"

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["200.59.126.59/32"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_security_group" "allow-mariadb" {
  vpc_id = aws_vpc.main.id
  name = "allow-mariadb"
  ingress {
    from_port = 3306
    protocol = "tcp"
    to_port = 3306
    security_groups = [aws_security_group.allow-ssh.id]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-mariadb"
  }
}