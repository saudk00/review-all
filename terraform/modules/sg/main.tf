resource "aws_security_group" "testsg" {
  name = "testsg"
  description = "security group for test123"
  vpc_id = var.vpc_id

}

resource "aws_vpc_security_group_ingress_rule" "testir1" {
  security_group_id = aws_security_group.testsg.id
  description = "allow http"
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "testir2" {
  security_group_id = aws_security_group.testsg.id
  description = "allow https"
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 443
  to_port = 443
}

resource "aws_vpc_security_group_ingress_rule" "testir3" {
  security_group_id = aws_security_group.testsg.id
  description = "allow ssh"
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "tester1" {
  security_group_id = aws_security_group.testsg.id
  description = "egress rule for test123; allow all traffic"
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = "-1"
  to_port = "-1"
}
