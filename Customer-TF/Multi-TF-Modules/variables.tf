variable "name" {
  type    = string
  default = "My Instance"
}

variable "db_user" {
  type    = string
  sensitive = true
}

variable "db_pass" {
  type    = string
  sensitive = true
}

data "aws_ssm_parameter" "db_pass" {
  name = var.param_db_pass_name
}

data "aws_ssm_parameter" "db_user" {
  name = var.param_db_user_name
}

variable "s3_bucket" {
  type    = string
  default = "my-app-bucket"
}

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
