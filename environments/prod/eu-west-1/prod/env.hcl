
locals {
  environment = "prod"
  tags = {
    Environment = local.environment
    Terragrunt  = "true"
  }
}
