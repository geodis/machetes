provider "aws" {
  
}

variable "AWS_REGION" {
  type = string
  description = "describe your variable"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "my ami"
  }
}

resource "aws_instance" "example" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}