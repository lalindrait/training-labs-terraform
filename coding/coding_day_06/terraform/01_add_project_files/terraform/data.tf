data "aws_availability_zones" "available_azs" {
  state = "available"

   filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}