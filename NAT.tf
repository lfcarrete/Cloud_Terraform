resource "aws_eip" "nat1" {
  depends_on = [
    aws_internet_gateway.interner_gateway_tf]
}
resource "aws_eip" "nat2" {
  depends_on = [
    aws_internet_gateway.interner_gateway_tf]
}

resource "aws_nat_gateway" "natgw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id = aws_subnet.pub1.id
  tags = {
      Name = "Nat 1"
  }
}

resource "aws_nat_gateway" "natgw2" {
  allocation_id = aws_eip.nat2.id
  subnet_id = aws_subnet.pub2.id
  tags = {
      Name = "Nat 2"
  }
}

resource "aws_route_table" "PubRout" {
    vpc_id = aws_vpc.tf_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.interner_gateway_tf.id
    }
    tags = {
      Name = "PublicRouterTable"
    }
}

resource "aws_route_table" "PrivRout1" {
    vpc_id = aws_vpc.tf_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw1.id
    }
    tags = {
      Name = "PrivateRouterTable1"
    }
}

resource "aws_route_table" "PrivRout2" {
    vpc_id = aws_vpc.tf_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw2.id
    }
    tags = {
      Name = "PrivateRouterTable2"
    }
}

resource "aws_route_table_association" "PubRouteTableAssociation1" {
    subnet_id = aws_subnet.pub1.id

    route_table_id = aws_route_table.PubRout.id
  
}

resource "aws_route_table_association" "PubRouteTableAssociation2" {
    subnet_id = aws_subnet.pub2.id

    route_table_id = aws_route_table.PubRout.id
  
}

resource "aws_route_table_association" "PrivRouteTableAssociation1" {
    subnet_id = aws_subnet.priv1.id

    route_table_id = aws_route_table.PrivRout1.id
  
}
resource "aws_route_table_association" "PrivRouteTableAssociation2" {
    subnet_id = aws_subnet.priv2.id

    route_table_id = aws_route_table.PrivRout2.id
  
}