resource "aws_key_pair" "mykey" {
  public_key = file(var.path_pub_key)
  key_name = "mykey"
}