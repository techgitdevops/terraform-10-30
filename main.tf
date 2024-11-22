resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
    name = "terraform-state-lock-dynamodb"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20

    attribute {
      name = "LockID"
      type = "S"
    }


  
}
resource "aws_instance" "dev_local" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    key_name = "virginiakey"
    availability_zone = "us-east-1a"
    
  }