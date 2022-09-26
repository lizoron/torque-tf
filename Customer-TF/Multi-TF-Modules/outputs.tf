output "public_dns" {
  value = 'aws_instance.myapp.public_dns:8080'
  kind: link
}

output "db_pass" {
  value = data.aws_ssm_parameter.db_pass.value
  sensitive = true
}

output "db_user" {
  value = data.aws_ssm_parameter.db_user.value
  sensitive = true
}
