variable "region" {
  type = string
  default = ""
  allowed_values = ["us-west-2", "us-east-1"]
}
variable "prefix" {}
variable "name" {}
# variable "encryption_key_arn" {
  # default = ""
  # type = string
# }