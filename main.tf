
#Giving the provider information

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


# Configure the AWS Provider

provider "aws" {
  region = "ap-south-1"
}


# Configure the EC2 instance type

resource "aws_instance" "my_server" {
  count = 3
  ami           = "ami-074dc0a6f6c764218"
  instance_type = "t2.micro"

  tags = {

    Name = "production"

  }
}


output "ec2_public_ips" {
value = aws_instance.my_server[*].public_ip

}


