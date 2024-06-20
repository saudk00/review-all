module "asg" {
  source = "./modules/asg"
  lt_id = "aws_launch_template.testlt.id"
  az1a = "us-east-1a"
  az1b = "us-east-1b"
}

module "lt" {
  source = "./modules/lt"
  image_id = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"
}

module "elb" {
  source = "./modules/elb"
  az1a = "us-east-1a"
  az1b = "us-east-1b"
}