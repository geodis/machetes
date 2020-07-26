data "template_file" "myapp-task-definition-template" {
  filename = file("templates/app.json.tpl")
  vars = {
    REPOSITORY_URL = replace(aws_ecr_repository.myapp.repository_url, "https://", "")
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
}