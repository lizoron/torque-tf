
output "public_dns" {
  value = aws_instance.myapp.public 
}
#Step 3
#output "public_dns" {
#  value = aws_instance.myapp.public_dns
#}
