module "consul" {
  source = "github.com/wardviaene/terraform-consul-module.git"
  key_name =aws_key_pair.mykey.key_name
  key_path = var.path_to_private_key

  region = var.aws_region
  vpc_id = aws_default_vps.default.id
  subnets = ""
}
output "consul-output" {
  value = module.consul.server_address
}