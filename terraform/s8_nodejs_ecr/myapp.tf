# Definicion de como correr la app de docker. (parametros del command line)
data "template_file" "myapp-task-definition-template" {
  template = file("templates/app.json.tpl")
  vars = {
    repository_url = replace(aws_ecr_repository.myapp.repository_url, "https://", "")
  }
}

resource "aws_ecs_task_definition" "myapp-task-definition" {
  container_definitions = data.template_file.myapp-task-definition-template.rendered
  family = "myapp"
}

resource "aws_ecs_service" "myapp-service" {
  name = "myapp-service"
  cluster = aws_ecs_cluster.example-cluster.id
  task_definition = aws_ecs_task_definition.myapp-task-definition.arn
  desired_count = 1
  iam_role = aws_iam_role.ecs-service-role.arn
  # make sure to set depends_on to the related aws_iam_role_policy
  depends_on = [aws_iam_policy_attachment.ecs-service-attach1]

  load_balancer {
    container_name = "myapp"
    container_port = 3000
    elb_name = aws_elb.myapp-elb.name
  }
}

resource "aws_elb" "myapp-elb" {
  name = "myapp-elb"
  listener {
    instance_port = 3000
    instance_protocol = "tcp"
    lb_port = 3000
    lb_protocol = "tcp"
  }
  # check de la instancia
  health_check {
    healthy_threshold = 3
    unhealthy_threshold = 3
    timeout = 30
    interval = 300
    target = "HTTP:3000/"
  }
  cross_zone_load_balancing = true
  subnets = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  security_groups = [aws_security_group.myapp-elb-securitygroup.id]
}