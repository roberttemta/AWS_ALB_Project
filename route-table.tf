
# create a route table

resource "aws_route_table" "alb-rt" {
  vpc_id = aws_vpc.alb_vpc.id
  tags = {
    "Name" = "Application-lb-route-table"
  }
}

# create a route table association

resource "aws_route_table_association" "private" {
  count          = length(var.subnet_cidr_private)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.alb-rt.id
}