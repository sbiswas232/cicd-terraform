provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
     Name = "${var.project}-vpc"
  }
}

resource "aws_subnet" "subnet" {
  count             = 2
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 1)
  availability_zone = data.aws_availability_zones.available_zone.names[count.index]
  tags = {
     Name = "${var.project}-subnet${count.index + 1}
  }
}

