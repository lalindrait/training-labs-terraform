locals {
  common_tags = {
    ApplicationName   = var.app_name
    AppOwner = var.app_owner
    CostCenter = var.cost_center
    Environment = var.app_env
  }
  
  region_short_name = {
        ap-south-1 = "mumbai"
        ap-southeast-1 = "sing"
        us-east-1 = "nv"
    }
}