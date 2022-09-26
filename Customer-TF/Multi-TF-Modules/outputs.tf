output "public_dns" {
  value = "http://aws_instance.myapp.public_dns"
}

output "db_pass" {
  value = data.aws_ssm_parameter.db_pass.value
  sensitive = true
}

output "db_user" {
  value = data.aws_ssm_parameter.db_user.value
  sensitive = true
}
