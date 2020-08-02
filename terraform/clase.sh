# Terraform
Chef, Puppet, Ansible, and SaltStack are all configuration management tools, which means they are designed to install and manage software on existing servers

CloudFormation and Terraform are provisioning tools, which means they are designed to provision the servers themselves (as well as the rest of your infrastructure, like load balancers, databases, networking configuration, etc), leaving the job of configuring those servers to other tools

Mutable Infrastructure vs Immutable Infrastructure
---------------------------------------------------
Chef, Puppet, Ansible, and SaltStack typically default to a mutable infrastructure paradigm

configuration drift: where each server becomes slightly different than all the others

Terraform to deploy machine images created by Docker or Packer, then every “change” is actually a deployment of a new server 

Procedural vs Declarative
-------------------------
Chef and Ansible encourage a procedural style where you write code that specifies, step-by-step, how to to achieve some desired end state.

Terraform, CloudFormation, SaltStack, and Puppet all encourage a more declarative style where you write code that specifies your desired end state, and the IAC tool itself is responsible for figuring out how to achieve that state.

Master Versus Masterless
------------------------
By default, Chef, Puppet, and SaltStack all require that you run a master server for storing the state of your infrastructure and distributing updates.
it’s a single, central place where you can see and manage the status of your infrastructure. 
the master server can revert that change to prevent configuration drift.


Combinacion de herramientas
---------------------------
Provisioning plus configuration management
Terraform and Ansible. You use Terraform to deploy all the underlying infrastructure, including the network topology (i.e., VPCs, subnets, route tables), data stores (e.g., MySQL, Redis), load balancers, and servers. You then use Ansible to deploy your apps on top of those servers.

Provisioning plus server templating
Terraform and Packer. You use Packer to package your apps as virtual machine images. You then use Terraform to deploy (a) servers with these virtual machine images and (b) the rest of your infrastructure, including the network topology (i.e., VPCs, subnets, route tables), data stores (e.g., MySQL, Redis), and load balancers.
 this is an immutable infrastructure approach
 virtual machines can take a long time to build 

Provisioning plus server templating plus orchestration
Terraform, Packer, Docker, and Kubernetes. You use Packer to create a virtual machine image that has Docker and Kubernetes installed. You then use Terraform to deploy (a) a cluster of servers, each of which runs this virtual machine image and (b) the rest of your infrastructure, including the network topology (i.e., VPCs, subnets, route tables), data stores (e.g., MySQL, Redis), and load balancers. Finally, when the cluster of servers boots up, it
forms a Kubernetes cluster that you use to run and manage your Dockerized applications.

