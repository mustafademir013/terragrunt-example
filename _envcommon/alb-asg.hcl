terraform {
  source = "${local.base_source_url}"
}

locals {

  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  
  env = local.environment_vars.locals.environment
  tags = local.environment_vars.locals.tags

  base_source_url = "git::git@github.com:mustafademir013/terraform-example.git//alb_asg"
}

inputs = {
  alb_name          = "app-alb-${local.env}"
  tags              = local.tags
}
