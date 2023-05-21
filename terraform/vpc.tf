/*
 * vpc.tf
 * Creates VPC and its related services
 */


# Main VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/21"

  tags = {
    Name = "Main VPC"
  }
}
