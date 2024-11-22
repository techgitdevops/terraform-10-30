resource "aws_instance" "myvm" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.medium"
    key_name = "virginiakey"
    availability_zone = "us-east-1c"
    tags = {
      Name="sonu"
    }
  
}
resource "aws_s3_bucket" "dev" {
    bucket = "myimportbuckett"

  
}
resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow inbound traffic to RDS instance"
  
}



  


