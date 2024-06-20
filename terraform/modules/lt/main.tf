resource "aws_launch_template" "testlt" {
  image_id = var.image_id
  instance_type = var.instance_type
  name = "testlt"
}