output "aws_instance" {
    description = "print public ip"
    value = aws_instance.name.public_ip
  
}