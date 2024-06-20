resource "aws_launch_template" "testlt" {
  image_id = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"
  name = "testlt"
}