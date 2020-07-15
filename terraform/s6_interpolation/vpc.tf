module "vpc-prod" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-prod"
  cidr = "10.0.0.0/16"

  azs = ["${var.aws_region}a", "${var.aws_region}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "prod"
  }
}

module "vpc-dev" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-dev"
  cidr = "10.0.0.0/16"

  azs = ["${var.aws_region}a", "${var.aws_region}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = true
    Environment = "dev"
  }
}