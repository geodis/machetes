provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-west-1"
}

resource "aws_instance" "example" {
  ami = "ami-0c1e832407373333f"
  instance_type = "t2.micro"
}
