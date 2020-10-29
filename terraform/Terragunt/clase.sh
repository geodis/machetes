https://blog.gruntwork.io/terragrunt-how-to-keep-your-terraform-code-dry-and-maintainable-f61ae06959d8

terragrunt plan
terragrunt apply
terragrunt output
terragrunt destroy

Soluciona 2 problemas de Terraform:
1. Lack of locking for Terraform state
2. Lack of way to configure Terraform state as code.

To use Terragrunt, add a single terragrunt.hcl file to the root of your repo, 
in the stage folder, and one terragrunt.hcl file in each module folder:

stage
├── terragrunt.hcl
├── frontend-app
│   ├── main.tf
│   └── terragrunt.hcl
└── mysql
    ├── main.tf
    └── terragrunt.hcl


# stage/terragrunt.hcl
remote_state {
  backend = "s3"
  config = {
    bucket = "my-terraform-state"
    
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-lock-table"
  }
}


The final step is to update each of the child terragrunt.hcl 
files to tell them to include the configuration from the root terragrunt.hcl:

You can now add as many child modules as you want, each with a terragrunt.hcl 
with the include { ... } block, and each of those modules will automatically 
inherit the proper backend configuration!

# stage/mysql/terragrunt.hcl
include {
	# esta funcion busca el root para buscar el terragunt.hcl padre y hereda 
	# la config del remote_state de el.
  path = find_in_parent_folders()
}


$ cd stage/mysql
$ terragrunt apply


You can tell Terraform to use these variables using the -var-file argument:

$ terraform apply \
    -var-file=../../common.tfvars \
    -var-file=../region.tfvars

Terragrunt allows you to keep your CLI arguments DRY 
by defining those arguments as code in your terragrunt.hcl configuration:

# terragrunt.hcl
terraform {
  extra_arguments "common_vars" {

    # commands = get_terraform_commands_that_need_vars()
    # built-in function to automatically get the list of all commands 
    # that accept -var-file and -var arguments:
    # 
    commands = ["plan", "apply"]

    arguments = [
      "-var-file=../../common.tfvars",
      "-var-file=../region.tfvars"
    ]
  }
}

It is a Bad Idea to define all of your environments (dev, stage, prod, etc), 
or even a large amount of infrastructure (servers, databases, load balancers, DNS, etc), 
in a single Terraform module. 

Large modules are slow, insecure, hard to update, hard to code review, hard to test, and brittle

├── prod
│   ├── app
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── mysql
│   │   ├── main.tf
│   │   └── outputs.tf
│   └── vpc
│       ├── main.tf
│       └── outputs.tf
├── qa
│   ├── app
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── mysql
│   │   ├── main.tf
│   │   └── outputs.tf
│   └── vpc
│       ├── main.tf
│       └── outputs.tf
└── stage
    ├── app
    │   ├── main.tf
    │   └── outputs.tf
    ├── mysql
    │   ├── main.tf
    │   └── outputs.tf
    └── vpc
        ├── main.tf
        └── outputs.tf




Terragunt 1st example

