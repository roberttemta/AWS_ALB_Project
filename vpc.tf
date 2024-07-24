
# create a vpc

resource "aws_vpc" "alb_vpc" {
  cidr_block           = "10.20.20.0/26"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "Application-lb"
  }
}