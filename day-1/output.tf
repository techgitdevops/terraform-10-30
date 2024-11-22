output "first" {
    description = "print public ip"
    value = aws_instance.first.public_ip
  
}