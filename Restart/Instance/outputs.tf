
output "public_dns" {
  value = aws_instance.myapp.public_dns
}

output "bucket_name" {
    value = aws_s3_bucket.bucket.id
}