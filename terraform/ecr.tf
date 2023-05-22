/*
 * ecr.tf
 * Creates a Amazon Elastic Container Registry (ECR) for the application
 */

 
resource "aws_ecr_repository" "ecr_repo" {

  for_each = toset(var.ecr_repos)
 
  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }    
}
