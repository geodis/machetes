resource "aws_key_pair" "mykeypair" {
  public_key = file(var.path_to_public_key)
  key_name = "mykey"
}