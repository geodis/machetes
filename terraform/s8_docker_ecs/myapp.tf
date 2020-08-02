data "template_file" "myapp-task-definition-template" {
  template = file("templates/app.json.tpl")
  vars = {
    repository_url = replace(aws_ecr_repository.ecr-example.repository_url, "https://", "")
  }
}
resource "aws_ecs_task_definition" "myapp-task-definition" {
  family = "myapp"
  container_definitions = data.template_file.myapp-task-definition-template.rendered
}
#  ELB
resource "aws_elb" "myapp-elb" {
  name = "myapp-elb"
  listener {
    instance_port = 3000
    instance_protocol = "http"
    lb_port = 3000
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 3
    interval = 60
    target = "HTTP:3000/"
    timeout = 30
    unhealthy_threshold = 3
  }
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400
  subnets = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  security_groups = [aws_security_group.myapp-elb-securitygroup.id]
  tags = {
    Name = "myapp-elb"
  }
}
resource "aws_ecs_service" "myapp-service" {
  name = "myapp-service"
  cluster = aws_ecs_cluster.example-cluster.id
  task_definition = aws_ecs_task_definition.myapp-task-definition.id
  desired_count = 1
  iam_role = aws_iam_role.ecs-service-role.id
  depends_on = [aws_iam_policy_attachment.ecs-service-attach1]

  load_balancer {
    container_name = "myapp"
    container_port = 3000
    elb_name = aws_elb.myapp-elb.name
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}










