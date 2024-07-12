variable "ami_id" {
  description = "Subnet cidr range for public subnets"
  default     = ""
}

variable "instance_type" {
  description = "Subnet cidr range for public subnets"
  default     = ""
}

variable "subnet_id" {
  description = "Subnet cidr range for public subnets"
  default     = ""
}

variable "instance_name_suffix" {
  description = "Subnet cidr range for public subnets"
  default     = "DefaultName"
}

variable "security_group_ids" {
  description = "Subnet cidr range for public subnets"
  default     = []
}

variable "tags" {
  description = "Subnet cidr range for public subnets"
  type        = map(string)
  default     = {}
}