
# configured aws provider with proper credentials
provider "aws" {
  region  = var.region
  profile = "default"
}
