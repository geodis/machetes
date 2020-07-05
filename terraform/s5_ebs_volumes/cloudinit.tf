data "template_file" "init-script" {
  template = file("scripts/init.cfg")
  vars = {
    # variable que se va a ver dentro del template file
    region = var.aws_region
  }
}

data "template_file" "shell-script" {
  template = file("scripts/volumes.sh")
  vars = {
    device = var.instance_device_name
  }
}

data "template_cloudinit_config" "cloudinit-example" {
  gzip = false
  base64_encode = false

  # ejecuta el init-script
  part {
    content_type = "text/cloud-config"
    # este file es opcional y creo que es un titulo nomas
    filename = "init.cfg"
    content = data.template_file.init-script.rendered
  }
  # ejecuta el shell-script
  part {
    content_type = "text/x-shellscript"
    content = data.template_file.shell-script.rendered
  }
}