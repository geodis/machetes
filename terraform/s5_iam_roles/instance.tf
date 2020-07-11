resource "aws_instance" "example" {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"
  # subnet
  subnet_id = aws_subnet.main-public-1.id
  # securitygroup
  vpc_security_group_ids = [aws_security_group.example-instance.id]
  # key ssh
  key_name = aws_key_pair.mykeypair.key_name
  # role
  iam_instance_profile = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name
}