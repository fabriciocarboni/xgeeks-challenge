/*
 * vpc.tf
 * Variables
 */

variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "ecr_repos" {
  default     = ["calculator", 
                  "addition", 
                  "division", 
                  "multiplication", 
                  "division", 
                  "reminder", 
                  "subtraction", 
                  "client",
                  "base"
                ]
  type        = list(string)
  description = "Repository names"
}
