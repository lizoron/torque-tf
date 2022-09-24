variable "name" {
  type    = string
  default = "My Instance"
}

variable "s3_bucket" {
  type    = string
  default = "my-app-bucket"
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}
