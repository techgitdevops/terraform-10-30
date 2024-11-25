module "dev" {
  source = "../day-1"
  ami = "ami-0c80e2b6ccb9ad6d1"
  instance_type = "t2.micro"
  key_name = "ohiokey"
  az = "us-east-2a"
  
  
  
}
resource "aws_s3_bucket" "name" {
  bucket = "sonusunnybucket"
  
}
provider "aws" {
  region = "us-east-2"
  
}
