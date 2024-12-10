# Variable for VPC CIDR block
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Variable for VPC name
variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
  default     = "projectk"
}

# Variable for Public Subnet CIDR block
variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/24"
}

# Variable for Private Subnet CIDR block
variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Variable for Public Subnet name
variable "public_subnet_name" {
  description = "The name tag for the public subnet"
  type        = string
  default     = "public"
}

# Variable for Private Subnet name
variable "private_subnet_name" {
  description = "The name tag for the private subnet"
  type        = string
  default     = "private"
}

# Variable for Internet Gateway name
variable "internet_gateway_name" {
  description = "The name tag for the internet gateway"
  type        = string
  default     = "ig1"
}

# Variable for NAT Gateway name
variable "nat_gateway_name" {
  description = "The name tag for the NAT gateway"
  type        = string
  default     = "nat"
}

# Variable for AMI ID
variable "ami_id" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
  default     = "ami-012967cc5a8c9f891"
}

# Variable for instance type
variable "instance_type" {
  description = "The instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

# Variable for Key Name
variable "key_name" {
  description = "The key name to use for EC2 instances"
  type        = string
  default     = "virginiakey"
}

# Variable for availability zone
variable "availability_zone" {
  description = "The availability zone to launch instances in"
  type        = string
  default     = "us-east-1a"
}

