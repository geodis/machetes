resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "main vpc"
  }
}

resource "aws_subnet" "main-public-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub2"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "priv1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-west-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "priv2"
  }
}

# Gateway
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-gw"
  }
}

# ruta de la red hacia GW
resource "aws_route_table" "gw-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
}

resource "aws_route_table_association" "main-public-1-a" {
  # subnet public 1
  subnet_id = aws_subnet.main-public-1.id
  # tabla de GW
  route_table_id = aws_route_table.gw-public.id
}

resource "aws_route_table_association" "main-public-2-a" {
  subnet_id = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.gw-public.id
}









