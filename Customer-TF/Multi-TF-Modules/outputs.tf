output "public_dns" {
  value = aws_instance.myapp.public_dns
}

output "db_pass" {
  value = data.aws_ssm_parameter.db_pass.value
  sensitive = true
}

output "db_user" {
  value = data.aws_ssm_parameter.db_user.value
  sensitive = true
}

output "bucket_name" {
    value = aws_s3_bucket.bucket.bucket
}

output "bucket_arn" {
    value = aws_s3_bucket.bucket.arn
}
