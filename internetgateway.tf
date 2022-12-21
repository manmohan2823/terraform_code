# Create Internet Gateway 
resource "aws_internet_gateway" "internet_gateway" {  
   vpc_id = aws_vpc.demo_vpc.id   
   tags = {     
            Name = "internet gateway"
          }
}
