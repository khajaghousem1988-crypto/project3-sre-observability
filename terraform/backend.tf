terraform {
  backend "s3" {
    # bucket = "banking-infra"
    bucket = "banking-infra-develop-p3"
    key    = "banking-infra-develop-p3/terraform.tfstate"
    #   project3-sre-observability/terraform.tfstate" 
    region  = "us-east-1"
    encrypt = true
  }
}
