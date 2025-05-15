output "privateip" {
    value = aws_instance.vsv.private_ip
    sensitive = true
}