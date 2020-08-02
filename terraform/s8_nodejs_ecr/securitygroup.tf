resource "aws_security_group" "ecs-securitygroup" {
  vpc_id = aws_vpc.main.id
  name = "ecs-securitygroup"
  description = "security group for ecs"
  ingress {
    from_port = 3000
    protocol = "tcp"
    to_port = 3000
    security_groups = [aws_security_group.myapp-elb-securitygroup.id]
  }
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
  tags = { Name = "ecs"}

}

resource "aws_security_group" "myapp-elb-securitygroup" {
  name = "myapp-elb"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "myapp-elb"}
}