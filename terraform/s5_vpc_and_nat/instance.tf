resource "aws_instance" "example" {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"
  # VPC subnet publica 1
  subnet_id = aws_subnet.main-public-1.id
  # security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  # ssh key
  key_name = aws_key_pair.mykeypair.key_name

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }
}

output "ip_publica" {
  value = aws_instance.example.public_ip
}