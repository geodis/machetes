module "vpc" {
  source = "terraform-aws-modules/vpc"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  
  
}