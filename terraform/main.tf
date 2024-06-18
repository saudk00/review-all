module "ec2" {
  source = "./modules/ec2"
}

module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}

module "sg" {
  source     = "./modules/sg"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc, module.ec2]
}

module "s3" {
  source = "./modules/s3"
}

module "route53" {
  source     = "./modules/route53"
  r53record  = module.ec2.privateip
  testvpc    = module.vpc.vpc_id
  depends_on = [module.vpc, module.ec2]
}

module "loadbalancer" {
  source     = "./modules/loadbalancer"
  sg         = module.sg.security_group_id
  subnet1    = module.vpc.subnet1 #call out outputs
  subnet2    = module.vpc.subnet2
  depends_on = [module.sg, module.vpc, module.ec2]
}

module "asg_lt" {
  source     = "./modules/asg_lt"
  security_group_id = module.sg.security_group_id
  subnet1 = module.vpc.subnet1
  subnet2 = module.vpc.subnet2
  depends_on = [module.ec2, module.sg, module.vpc, module.loadbalancer]
}