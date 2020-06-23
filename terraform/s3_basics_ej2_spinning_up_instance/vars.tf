// Definificion de variables, tipo, defaults.
variable "aws_secret_key" {}
variable "aws_access_key" {}
variable "aws_region" {
  type = string
  default = "us-west-1"
}
variable "amis" {
  type = map(string)
  default = {
    us-west-1 = "ami-0c1e832407373333f"
    us-east-1 = "ami-0a0ddd875a1ea2c7f"
    us-west-2 = "ami-0a4df59262c92cf19"
  }
}