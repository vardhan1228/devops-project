
# create vpc
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc-cidr
    enable_dns_hostnames = true
  tags = {
    Name = "cust-vpc"
  }
}
# create internet gateway
resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.vpc.id
    tags = {
    Name = "cust-ig"
  }
}

# create subnet 1
resource "aws_subnet" "pub-sub1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pub-sub1-cidr
    availability_zone = var.pub-sub1-az
    map_public_ip_on_launch = true  # for auto asign public ip for subnet
    tags = {
    Name = "cust-sub1"
  }
}
# create subnet 2
resource "aws_subnet" "pub-sub2" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.pub-sub2-az
  cidr_block = var.pub-sub2-cidr
  map_public_ip_on_launch = true  # for auto asign public ip for subnet
  tags = {
    Name = "cust-sub2"
  }
}
 # create route table and attch ig
 resource "aws_route_table" "day2-rt" {
    vpc_id = aws_vpc.vpc.id
    tags = {
    Name = "cust-rt"
        }
  # route table edit route and attach ig
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id

    }
    
}

#asociate subnet1 to route table
resource "aws_route_table_association" "day2-rt-sub1" {
    route_table_id = aws_route_table.day2-rt.id
    subnet_id = aws_subnet.pub-sub1.id
  
  
}
#asociate subnet2 to route table
resource "aws_route_table_association" "day2-rt-sub2" {
  route_table_id = aws_route_table.day2-rt.id
  subnet_id = aws_subnet.pub-sub2.id
}

# create security group
resource "aws_security_group" "cust-sg" {
    vpc_id = aws_vpc.vpc.id
    tags = {
    Name = "cust-sg"
  }
  ingress {
    description = "http for sg"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh for sg"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    description = "outbond of sg"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}









