resource "aws_key_pair" "mykey" {
  public_key = file(var.path_to_public_key)
  key_name = "mykey"
}