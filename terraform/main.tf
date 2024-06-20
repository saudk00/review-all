module "asg" {
  source = "./modules/asg"
  lt-id = module.lt.lt-id
  az1a = module.alb.az1a
  az1b = module.alb.az1b
  depends_on = [ module.lt ]
}

module "lt" {
  source = "./modules/lt"
  image_id = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"
}

module "alb" {
  source = "./modules/alb"
  az1a = module.asg.az1a
  az1b = module.asg.az1b
}