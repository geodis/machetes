variable "aws_region" {
  type = string
  default = "us-west-1"
}

variable "instance_device_name" {
  type = string
  default = "/dev/xvdh"
}
variable "jenkins_version" {
  type = string
  default = ""
}
variable "terraform_version" {
  type = string
  default = ""
}

variable "public_key" {
  type = string
  default = "mykey.pub"
}

variable "private_key" {
  type = string
  default = "mykey"
}

// count = var.app_instance_count
//  ami = var.app_instance_ami

variable "app_instance_count" {
  type = number
  default = 0
}

variable "app_instance_ami" {

}