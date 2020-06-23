resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = file(var.path_to_public_key)
}

resource "aws_instance" "example" {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"
  key_name = aws_key_pair.mykey.key_name

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    type = "ssh"
    host = coalesce(self.public_ip, self.private_ip)
    user = var.instance_username
    private_key = file(var.path_to_private_key)

  }
}