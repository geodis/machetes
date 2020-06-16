provider "aws" {
  access_key = "AKIAVAA75NHAKI6W676G"
  secret_key = "155z+aaRMR5LC+43rTw8lSozzDMQs01JSXM5N9oD"
  region = "us-west-1"
}

resource "aws_instance" "example" {
  ami = "ami-0c1e832407373333f"
  instance_type = "t2.micro"
}