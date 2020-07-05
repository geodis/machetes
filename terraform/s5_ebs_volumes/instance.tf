resource "aws_instance" "example" {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"

  subnet_id = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name = aws_key_pair.mykeypair.key_name
  user_data = data.template_cloudinit_config.cloudinit-example.rendered
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-west-1a"
  size = 20
  type = "gp2"
  tags = {
    Name = "extra volume"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  instance_id = aws_instance.example.id
  volume_id = aws_ebs_volume.ebs-volume-1.id
}

output "ip-publica" {
  value = aws_instance.example.public_ip
}