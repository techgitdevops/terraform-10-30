resource "aws_vpc" "dev_local" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name="projectk"
    }
  
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.dev_local.id
    cidr_block = "10.0.0.0/24"
    tags = {
      name="public"
    }
  
}
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.dev_local.id
  cidr_block = "10.0.1.0/24"
  tags = {
    name="private"
  }
  
}
resource "aws_internet_gateway" "ig1" {
    vpc_id = aws_vpc.dev_local.id
    tags = {
      name="ig1"
    }
  
}
resource "aws_eip" "eip" {

  
}
resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.private.id
  allocation_id = aws_eip.eip.id
  tags = {
    name="nat"
  }

  
}
resource "aws_route_table" "pub-route" {
  vpc_id = aws_vpc.dev_local.id
  tags = {
    name="pub-route"
  }

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.ig1.id
    
  }
}
resource "aws_route_table" "pvt-route" {
  vpc_id = aws_vpc.dev_local.id
  tags = {
    name="pvt-route"
  }
  route{
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }  
}

resource "aws_route_table_association" "pub-rt-as" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.pub-route.id
  

}
resource "aws_route_table_association" "pvt-rt-as" {
  route_table_id = aws_route_table.pvt-route.id
  subnet_id =aws_subnet.private.id
  
}
resource "aws_security_group" "sg" {
  name        = "security group description"
  vpc_id      = aws_vpc.dev_local.id
  tags = {
    Name = "sg"
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
  resource "aws_instance" "pub-server" {
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    key_name = "virginiakey"
    availability_zone = "us-east-1a"
    associate_public_ip_address = true
    tags = {
      name="public"
    }
    
      
    }
  resource "aws_instance" "pvt-server" {
    subnet_id = aws_subnet.private.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    key_name = "virginiakey"
    availability_zone = "us-east-1a"
    
  }

  
