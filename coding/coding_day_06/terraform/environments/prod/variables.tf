variable "region" {
  default = "ap-south-1"
}

variable "region_short_name" {
  type = map(any)
  default = {
    "ap-south-1"     = "mumbai"
    "us-east-1"      = "nv"
    "ap-southeast-1" = "sing"
  }
}

# locals {

#   region_short_name = {
#     "ap-south-1"     = "mumbai"
#     "us-east-1"      = "nv"
#     "ap-southeast-1" = "sing"
#   }
# }