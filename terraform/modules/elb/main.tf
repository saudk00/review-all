resource "aws_elb" "testelb" {
  name = "testelb"
  availability_zones = [ "us-east-1a", "us-east-1b" ]

  listener {
    instance_port = 8080
    lb_port = 80
    lb_protocol = "http"
    instance_protocol = "http"
  }
  listener {
    instance_port = 8080
    lb_port = 443
    lb_protocol = "https"
    instance_protocol = "https"
  }
}