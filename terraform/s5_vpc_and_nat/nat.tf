/* comento para no usar NAT con la instancia

# NAT GW -- para proveer acceso a internet a las instancias de la
# red privada, pero no vicecersa

# IP estatica (ElasticIP)
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.main-public-1.id
  depends_on = [aws_internet_gateway.main-gw]
}

# VPC resource NAT
resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "main-private"
  }
}

resource "aws_route_table_association" "main-private-1-a" {
  subnet_id = aws_subnet.main-private-1.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-1-b" {
  subnet_id = aws_subnet.main-private-2.id
  route_table_id = aws_route_table.main-private.id
}

//resource "aws_route_table_association" "main-private-1-c" {
//  subnet_id = aws_subnet.main-private-3.id
//  route_table_id = aws_route_table.main-private.id
//}

*/





















