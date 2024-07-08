resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

   tags = merge(
                var.tags, 
                tomap(
                    {
                      "Name" = "vpc_${var.tags.RegionShortName}_${var.tags.ApplicationName}_${var.tags.Environment}"
                      "ResourceType" = "VPC"
                    }                      
                  )                      
              )
}

