resource "aws_vpc" "testvpc" {
  cidr_block = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "testsubnet1" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "testsubnet2" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.testvpc.id
}

resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-1.id
  }
}

resource "aws_route_table_association" "pub-route" {
  subnet_id      = aws_subnet.testsubnet1.id
  route_table_id = aws_route_table.pub-route-table.id
}

resource "aws_route_table_association" "pub-route-2" {
  subnet_id      = aws_subnet.testsubnet2.id
  route_table_id = aws_route_table.pub-route-table.id
}