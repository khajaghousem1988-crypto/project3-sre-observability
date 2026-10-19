# variable "aws_region" { type=string default="us-east-1" }
# variable "project_name" { type=string default="banking-sre" }
# variable "environment" { type=string default="dev" }
variable "eks_cluster_name" {
  type    = string
  default = "banking-eks-dev-cluster"
}
# variable "vpc_id" {
#   type        = string
#   description = "Existing Project 2 VPC"
# }
variable "alert_email" {
  type    = string
  default = ""
}

variable "log_retention_days" {
  type    = number
  default = 30
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "banking-eks"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project1_state_bucket" {
  description = "S3 bucket containing Project 1 Terraform state"
  type        = string
  # default     = "banking-infra-dev"
  default = "banking-infra-develop-p3"
}

variable "project1_state_key" {
  description = "Project 1 Terraform state key"
  type        = string
  default     = "terraform.tfstate"
}

