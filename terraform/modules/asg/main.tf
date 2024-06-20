resource "aws_autoscaling_group" "testasg" {
  name = "testasg"
  min_size = 2
  max_size = 4
  availability_zones = [ "us-east-1a", "us-east-1b" ]
  health_check_grace_period = 300
  health_check_type         = "ELB"
    desired_capacity          = 3
    force_delete = true

    launch_template {
      id = var.lt_id
      version = "$Latest"
    }
}