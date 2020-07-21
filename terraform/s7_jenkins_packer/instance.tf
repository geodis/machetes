data "aws_ami" "ubuntu-ami" {
  owners = ["099720109477"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "jenkins-instance" {
  ami = data.aws_ami.ubuntu-ami.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main-public-1.id
  security_groups = [aws_security_group.app-securitygroup.id]
  key_name = aws_key_pair.mykeypair.key_name

  # Necesito ejecutar comandos cuando levante Jenkins
  user_data = data.template_cloudinit_config.cloudinit-jenkins.rendered
  # iam instance profile
  iam_instance_profile = aws_iam_instance_profile.jenkins-role.name
}

resource "aws_ebs_volume" "jenkins-data" {
  availability_zone = "us-west-1"
  size = 20
  type = "gp2"
  tags = {
    Name = "jenkins-data"
  }
}
resource "aws_volume_attachment" "jenkins-data-attachment" {
  device_name = var.instance_device_name
  instance_id = aws_instance.jenkins-instance.id
  volume_id = aws_ebs_volume.jenkins-data.id
  skip_destroy = true
}

# La aplicacion
resource "aws_instance" "app-instance" {
  count = var.app_instance_count
  ami = var.app_instance_ami
  instance_type = "t2.micro"

  subnet_id = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.app-securitygroup.id]
  key_name = aws_key_pair.mykeypair.key_name
}