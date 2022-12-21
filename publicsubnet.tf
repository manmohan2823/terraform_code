resource "aws_subnet" "public_subnet" {  
vpc_id                  = aws_vpc.demo_vpc.id  
cidr_block              = "172.16.1.0/24"
availability_zone       = "ap-south-1a" 
map_public_ip_on_launch = true  
tags = {      
         Name = "public_subnet"
      }
} 

# Create Public Route Table
resource "aws_route_table" "pub_sub_rt" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
   }
    tags = {
    Name = "public subnet route table" 
 }
}
