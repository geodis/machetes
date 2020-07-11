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

variable "path_to_public_key" {
  type = string
  default = "mykey.pub"
}

variable "path_to_private_key" {
  type = string
  default = "mykey"
}

