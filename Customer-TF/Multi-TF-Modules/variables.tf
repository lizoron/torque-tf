variable "name" {
  type    = string
  default = "My Instance"
}

#variable "s3_bucket" {
#  type    = string
#  default = "my-app-bucket"
#}

variable "bucket_name" {
  type    = string
  default = "ericsilverbuckets"
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
