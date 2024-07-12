variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "public_subnet_cidr_ranges" {
  description = "Subnet cidr range for public subnets"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_ranges" {
  description = "Subnet cidr range for private subnets"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  description = "List of AZs"
  type        = list(string)
  default     = []
}