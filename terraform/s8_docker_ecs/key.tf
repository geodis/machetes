resource "aws_key_pair" "mykeypair" {
  public_key = file(var.public_key)
  key_name = "mykeypair"
  lifecycle {
    ignore_changes = [public_key]
  }
}