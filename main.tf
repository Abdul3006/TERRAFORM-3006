terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-00c6177f250e07ec1" 
  instance_type = "t2.micro" 

  tags = {
    Name = "MyEC2Instance"
  }
}
