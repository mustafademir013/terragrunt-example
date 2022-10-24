
terraform {
  source = "${local.base_source_url}"
}

locals {

  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  region = local.region_vars.locals.aws_region
  env    = local.environment_vars.locals.environment
  tags   = local.environment_vars.locals.tags

  base_source_url = "git::git@github.com:mustafademir013/terraform-example.git//vpc"
}

inputs = {
  vpc_name = "app_vpc_${local.env}"
  region   = local.region
  tags     = local.tags
}
