terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "vpc1" {
  cidr_block = "172.16.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  tags = {
     Name = "VPC1"
  }
}

resource "aws_subnet" "publicsubnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "172.16.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-southeast-1a"
  tags = {
     Name = "Public-Sub1"
  }
}

resource "aws_vpc" "vpc2" {
  cidr_block = "172.17.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  tags = {
     Name = "VPC2"
  }
}
