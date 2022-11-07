variable "name" {
  type    = string
  default = "My Instance"
}

variable "db_user" {
  type    = string
  sensitive = true
  default = "admin"
}

variable "db_pass" {
  type    = string
  sensitive = true
  default = "admin"
}

variable "bucket_name" {
  type    = string
  default = "my-app-bucket"
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}