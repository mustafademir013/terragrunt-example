include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/alb-asg.hcl"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  alb_create = true
  asg_create = true

  vpc_id          = dependency.vpc.outputs.vpc_id
  vpc_cidr_block  = dependency.vpc.outputs.vpc_cidr_block
  public_subnets  = dependency.vpc.outputs.public_subnets
  private_subnets = dependency.vpc.outputs.private_subnets

  instance_type    = "t2.micro"
  ami              = "ami-0e70bf1b1473889b4"
  alb_name         = "app-alb-production"
  min_size         = 2
  max_size         = 3
  desired_capacity = 2
}