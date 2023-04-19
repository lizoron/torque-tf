variable "region" {
  type = list(string)
  default = ["us-west-2", "us-east-1"]
}
variable "prefix" {}
variable "name" {}
# variable "encryption_key_arn" {
  # default = ""
  # type = string
# }