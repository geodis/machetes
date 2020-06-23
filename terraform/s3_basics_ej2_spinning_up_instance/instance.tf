
resource "aws_instance" "example" {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"
}
