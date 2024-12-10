resource "aws_s3_bucket" "name" {
    bucket = var.aws_s3_bucket
  
}
resource "aws_instance" "name" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = var.az
  
}