module "sns" {
  source      = "./modules/sns"
  name_prefix = "${var.project_name}-${var.environment}"
  alert_email = var.alert_email
}
module "cloudwatch" {
  source             = "./modules/cloudwatch"
  name_prefix        = "${var.project_name}-${var.environment}"
  log_retention_days = var.log_retention_days
  sns_topic_arn      = module.sns.topic_arn
}

module "vpc_flow_logs" {
  source      = "./modules/vpc-flow-logs"
  name_prefix = "${var.project_name}-${var.environment}"
  # vpc_id             = var.vpc_id
  vpc_id             = local.shared_vpc_id
  log_retention_days = var.log_retention_days
}

##########Module_ECR##########
module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
  environment  = var.environment
}

##########AWS_Instance_Type##########

# resource "aws_instance" "example" {
#   ami           = var.ami_id
#   instance_type = var.instance_type   # <-- reference happens here

#   tags = {
#     Name        = "${var.project_name}-${var.environment}"
#     Environment = var.environment
#   }
# }

# data "aws_ami" "amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }

# resource "aws_instance" "example" {
#   ami           = data.aws_ami.amazon_linux.id
#   instance_type = var.instance_type
# }