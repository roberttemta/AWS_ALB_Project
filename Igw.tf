
# create an internet gateway

resource "aws_internet_gateway" "alb-igw" {
  vpc_id = aws_vpc.alb_vpc.id
  tags = {
    "Name" = "Application-lb-gateway"
  }
}

# create an internet route

resource "aws_route" "internet-route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.alb-rt.id
  gateway_id             = aws_internet_gateway.alb-igw.id
}