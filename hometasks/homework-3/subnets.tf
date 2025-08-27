resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2c"
  tags = {
    Name = "public-subnet-3"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-2c"
  tags = {
    Name = "private-subnet-3"
  }
}