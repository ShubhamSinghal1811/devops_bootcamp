resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.wordpress.id
  cidr_block = var.cidr[count.index]
  availability_zone = var.az[count.index]
  count = 2

  tags = {
    Name = "Public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.wordpress.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Private-subnet"
  }
}

data "aws_subnets" "sid" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.wordpress.id]
  }

  tags = {
    Tier = "Public"
  }
}