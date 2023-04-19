variable "region" {
  type = list
  default = ""
  allowed_values = ["us-west-2", "us-east-1"]
}
variable "prefix" {}
variable "name" {}
# variable "encryption_key_arn" {
  # default = ""
  # type = string
# }