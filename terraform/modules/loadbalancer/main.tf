resource "aws_lb" "testlb" {
  name = "testlb"
  internal = false #false means i can route traffic outside of network; true means i can route trafic inside of network
  load_balancer_type = "application"
  security_groups = [ var.sg ]
  subnets = [ var.subnet1, var.subnet2 ]

}