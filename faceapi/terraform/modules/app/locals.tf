locals {
  name        = var.name
  environment = var.environment
  region      = var.region

  tags = {
    Name        = local.name
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}
