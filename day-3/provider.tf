terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0.0, < 5.0.0"
    }
  }
}
provider "aws" {
    region = "us-east-2"
  
}