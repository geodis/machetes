
resource "aws_instance" "example" {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"
  # subnet de pertenencia
  subnet_id = aws_subnet.main-public-1.id
  # ssh-key
  key_name = aws_key_pair.mykey.key_name
  # security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
}