terraform {
  backend "s3" {
    bucket = "terraform-state-sdwer"
    key = "terraform/demo4"
    region = "us-west-1"
  }
}


