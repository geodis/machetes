#!/bin/bash
ami_id=$(packer build -machine-readable packer-example.json | tee linea | awk -F, '$0 ~/artifact,0,id/ {print $6}' | cut -d ':' -f2)
echo 'variable "ami_id" { default = "'${ami_id}'" }' > amivar.tf
echo "sleep"
sleep 5
echo "init"
terraform init
echo "plan"
terraform plan