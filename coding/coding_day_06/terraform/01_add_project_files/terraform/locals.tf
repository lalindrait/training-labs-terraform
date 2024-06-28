locals {
  common_tags = {
    ApplicationName   = var.app_name
    AppOwner = var.app_owner
    CostCenter = var.cost_center
    Environrment = var.app_env
  }
}