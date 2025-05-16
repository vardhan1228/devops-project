output "privateip" {
    value = aws_instance.vsv.private_ip
    sensitive = true
}
output "public_ip" {
  value = aws_instance.vsv.public_ip
}