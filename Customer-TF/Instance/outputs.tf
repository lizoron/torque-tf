
output "public_dns" {
  value = aws_instance.myapp.public_dns #something not sure??

  # hint: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
}

