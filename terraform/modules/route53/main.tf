resource "aws_route53_zone" "testr53" {
  name = "private-route-53-zone"
  force_destroy = true
#routes private ip from instance
  vpc {
    vpc_id = var.testvpc
  }
}

resource "aws_route53_record" "testrecord" {
  name = "route-53-record"
  type = "A"
  zone_id = aws_route53_zone.testr53.id
  ttl = 300
  records = [var.r53record]
}