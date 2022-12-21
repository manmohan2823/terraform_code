# Create EIP for NAT GATEWAY  
resource "aws_eip" "eip_natgw" {  
     count = "1"
} 
# Create NAT gateway
resource "aws_nat_gateway" "natgateway" {  
     count         = "1"  
     allocation_id = aws_eip.eip_natgw[count.index].id  
     subnet_id     = aws_subnet.public_subnet.id
} 