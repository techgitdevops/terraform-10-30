resource "aws_vpc" "dev_local" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name="projectk"
    }
  
}
resource "aws_subnet" "dev_local" {
    vpc_id = aws_vpc.dev_local.id
    cidr_block = "10.0.0.0/24"
    tags = {
      name="public"
    }
  
}
resource "aws_internet_gateway" "dev_local" {
    vpc_id = aws_vpc.dev_local.id
    tags = {
      name="ig1"
    }
  
}
resource "aws_route_table" "dev_local" {
  vpc_id = aws_vpc.dev_local.id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.dev_local.id
  }
}

resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.dev_local.id
    route_table_id = aws_route_table.dev_local.id

}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.dev_local.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }
  resource "aws_instance" "dev_local" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    key_name = "virginiakey"
    availability_zone = "us-east-1a"
    
  }
  
