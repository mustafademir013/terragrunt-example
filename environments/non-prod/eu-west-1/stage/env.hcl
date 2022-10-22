
locals {
  environment = "stage"
  tags = {
    Environment = local.environment
    Terragrunt  = "true"
  }
}
