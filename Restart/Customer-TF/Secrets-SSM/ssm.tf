variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "param_db_pass_name" {
  type    = string
  default = "example_db_password"
}

variable "param_db_user_name" {
  type    = string
  default = "example_db_user"
}

data "aws_ssm_parameter" "db_pass" {
  name = var.param_db_pass_name
}

data "aws_ssm_parameter" "db_user" {
  name = var.param_db_user_name
}

output "db_pass" {
  value = data.aws_ssm_parameter.db_pass.value
  sensitive = true
}

output "db_user" {
  value = data.aws_ssm_parameter.db_user.value
  sensitive = true
}

provider "aws" {
  region  = var.aws_region

}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">3.0.0"
    }
  }
}
