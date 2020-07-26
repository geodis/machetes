# CLUSTER
resource "aws_ecs_cluster" "example-cluster" {
  name = "example-cluster"
}

resource "aws_launch_configuration" "ecs-example-launchconfig" {
  name_prefix = "ecs-launchconfig"
  image_id = var.ecs_amis[var.aws_region]
  instance_type = "t2.micro"
  key_name = aws_key_pair.mykeypair.key_name
  iam_instance_profile = aws_iam_instance_profile.ecs-ec2-role.id
  security_groups = [aws_security_group.ecs-securitygroup.id]
  user_data = "#!/bin/bash\necho 'ECS_CLUSTER=example-cluster' > /etc/ecs/ecs.config\nstart ecs"
  lifecycle {create_before_destroy = true}
}

resource "aws_autoscaling_group" "ecs-example-autoscaling" {
  max_size = 1
  min_size = 1
  name = "ecs-example-autoscaling"
  vpc_zone_identifier = [aws_subnet.main-public-1.id,aws_subnet.main-public-1.id]
  launch_configuration = aws_launch_configuration.ecs-example-launchconfig.name
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "ecs-ec2-container"
  }
}