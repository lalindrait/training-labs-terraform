locals {
  tags = {
    "ApplicationName" = "devops-testbed",
    "ApplicationID"   = "APP-00100",
    "CostCenter"      = "MSD",
    "BusinessEntity"  = "MSD",
    "Project"         = "Cloud-Training",
    "Team"            = "MSD-Cloud",
    "Environment"     = local.environment,
    "AssetOwner"      = "MSD-Cloud",
    "AssetUser"       = "MSD-Cloud",
    "RiskOwner "      = "Dinuka",
    "Organization"    = "MITESP",
    "Region"              = var.region,
    "RegionShortName"     = local.region_short_name[var.region],
    "Automation"          = "Terraform",
    "AssetClassification" = "Low"
  }
}


