
output "public_dns" {
  value = aws_instance.myapp.public #something not sure??

  # hint: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
}
#Step 3
#output "public_dns" {
#  value = aws_instance.myapp.public_dns
#}
