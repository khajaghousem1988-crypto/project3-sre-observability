data "aws_caller_identity" "current" {}
data "aws_eks_cluster" "existing" {
  name = var.eks_cluster_name
}

data "terraform_remote_state" "project1" {
  backend = "s3"

  config = {
    bucket = var.project1_state_bucket
    key    = var.project1_state_key
    region = var.aws_region
  }
}

#####################################################
# Project 2 — EKS
#
# EKS resources will be added here in controlled
# phases. Project 1 resources are consumed as outputs
# only and are not recreated or moved.
#####################################################

locals {
  shared_vpc_id             = data.terraform_remote_state.project1.outputs.vpc_id
  shared_public_subnet_ids  = data.terraform_remote_state.project1.outputs.public_subnet_ids
  shared_private_subnet_ids = data.terraform_remote_state.project1.outputs.private_subnet_ids
}

