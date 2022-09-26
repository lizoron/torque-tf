
output "public_dns" {
  value = 'http://aws_instance.myapp.public_dns' #something not sure??.
  kind: link

  # hint: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
}

