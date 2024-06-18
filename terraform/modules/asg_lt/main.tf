resource "aws_launch_template" "testlt" {
  image_id = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"
  name = "testlt"
  vpc_security_group_ids = [var.security_group_id]
}

resource "aws_autoscaling_group" "testasg" {
  name = "testasg"
  min_size = 2
  max_size = 4
  health_check_grace_period = 300
  health_check_type         = "ELB"
    desired_capacity          = 3
    force_delete = true
    vpc_zone_identifier = [ var.subnet1, var.subnet2 ]

    launch_template {
      id = aws_launch_template.testlt.id
      version = "$Latest"
    }
}