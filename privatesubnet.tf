resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "172.16.3.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false
tags = {
    Name = "private_subnet" 
}
}

# Create private route table for private subnet
resource "aws_route_table" "prv_sub_rt" {
  count  = "1"
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway[count.index].id
  }
  tags = {
    Name = "private subnet route table" 
 }
}

# Create route table association between privatev subnet & NAT Gateway
resource "aws_route_table_association" "prv_sub_to_natgw" {
  count          = "1"
  route_table_id = aws_route_table.prv_sub_rt[count.index].id
  subnet_id      = aws_subnet.private_subnet.id
}