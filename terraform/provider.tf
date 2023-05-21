/*
 * provider.tf
 * Creates provider and set region
 */

terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = var.aws_region
}
