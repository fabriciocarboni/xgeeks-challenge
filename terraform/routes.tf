/*
 * routes.tf
 * Creates routing tables and associated subnets
 */

# Route Table for Public Subnet
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Association between Public Subnet and Public Route Table
resource "aws_route_table_association" "public-assoc-a" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "public-assoc-b" {
  subnet_id      = aws_subnet.public-b.id
  route_table_id = aws_route_table.public-rt.id
}


# Route Table for Private Subnet via nat-gw-a
resource "aws_route_table" "private-rt-a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw-a.id
  }

  tags = {
    Name = "Private Route Table-a"
  }
}

# Route Table for Private Subnet via nat-gw-b
resource "aws_route_table" "private-rt-b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw-b.id
  }

  tags = {
    Name = "Private Route Table-b"
  }
}

# Association between Private Subnet and Private Route Table
resource "aws_route_table_association" "private-assoc-a" {
  subnet_id      = aws_subnet.private-a.id
  route_table_id = aws_route_table.private-rt-a.id
}

resource "aws_route_table_association" "private-assoc-b" {
  subnet_id      = aws_subnet.private-b.id
  route_table_id = aws_route_table.private-rt-b.id
}
