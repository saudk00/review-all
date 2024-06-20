resource "aws_alb" "testlb" {
  name = "testlb"
  load_balancer_type = "application"
  internal = false
  subnets = [ "subnet-00b69f12242afc09d", "subnet-09c9ab9925c0bd1ce" ]

  depends_on = [ aws_alb_target_group.testtg ]
}

resource "aws_alb_listener" "testlistener" {
  load_balancer_arn = aws_alb.testlb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.testtg.arn
    type = "forward"
  }
  depends_on = [ aws_alb_target_group.testtg ]
}

resource "aws_alb_target_group" "testtg" {
  name = "testtg"
  load_balancing_algorithm_type = "round_robin"
  target_type = "instance"
  vpc_id = "vpc-00a0c1e35e30455e9"
  port = 80
  protocol = "HTTP"
}