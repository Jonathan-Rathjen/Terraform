# Public Subnets
resource "aws_subnet" "public" {
  count = length(var.az_suffixes)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index) 
  availability_zone       = "us-east-2${var.az_suffixes[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count = length(var.az_suffixes)

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 3)
  availability_zone = "us-east-2${var.az_suffixes[count.index]}"

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}
