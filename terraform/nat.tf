/*
 * nat.tf
 * Creates nat gateway for the private subnets to allow services to connect to the internet
 */


resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat-gw-a" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-a.id

  tags = {
    Name = "nat-a"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat-gw-b" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-b.id

  tags = {
    Name = "nat-b"
  }

  depends_on = [aws_internet_gateway.igw]
}
