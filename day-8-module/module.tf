module "dev" {
  source = "../day-1"
  ami = "ami-012967cc5a8c9f891"
  instance_type = "t2.medium"
  key_name = "virginiakey"
  az = "us-east-1a"
  
  
  
}