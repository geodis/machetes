variable "aws_region" {
  type = string
  default = "us-west-1"
}

variable "path_to_public_key" {
  type = string
  default = "mykey.pub"
}

variable "path_to_private_key" {
  type = string
  default = "mykey"
}

variable "env" {
  default = "prod"
}