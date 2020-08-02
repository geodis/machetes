
variable "aws_region" {
    type = string
    default = "us-west-1"
}
variable "public_key" {
    type = string
    default = "mykey.pub"
}
variable "aws_instance_type" {
    type = string
    default = "t2.micro"
    description = "(optional) describe your variable"
}

# Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
variable "ecs_amis" {
  type = map(string)
  default = {
//    us-east-1 = "ami-1924770e"
//    us-west-2 = "ami-56ed4936"
    us-west-1 = "ami-00271233a1ebb9161"
//    eu-west-1 = "ami-c8337dbb"
  }
}
