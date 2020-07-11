resource "aws_s3_bucket" "mybucket" {
  bucket = "terraform-state-sdwesdar"
  acl = "private"
  tags = {
    Name = "terraform-state-sdwesdar"
  }
}