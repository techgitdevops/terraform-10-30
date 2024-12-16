provider "aws" {
    region = "us-east-1"
  
}
module "dev" {
    source = "../day-2"
    ami ="ami-0453ec754f44f9a4a"
    aws_instance ="t2.micro"
    key_name = "virginiakey"
    az = "us-east-1a"
    
  
}


