provider "aws" {
  profile = "terraform"
  shared_credentials_file = "/Users/katsuki_y/.aws/credentials"
  region = "ap-northeast-1"
}

resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "dev_private" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.dev_vpc.id
}

resource "aws_subnet" "dev_public" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.dev_vpc.id
}