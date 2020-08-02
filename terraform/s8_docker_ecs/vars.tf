variable "aws_region" {
  type = string
  default = "us-west-1"
}
variable "public_key" {
  type = string
  default = "mykey.pub"
}
variable "ecs_amis" {
  type = map(string)
  default = {
//    us-east-1 = "ami-1924770e"
//    us-west-2 = "ami-56ed4936"
    us-west-1 = "ami-00271233a1ebb9161"
  }
}