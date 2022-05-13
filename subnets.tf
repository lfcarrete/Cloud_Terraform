resource "aws_subnet" "pub1" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = "192.168.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
      Name = "pub1A"
      "kubernets.io/cluster/eks" = "shared"
      "kubernets.io/role/elb" = 1
  }
}

resource "aws_subnet" "pub2" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
      Name = "pub1B"
      "kubernets.io/cluster/eks" = "shared"
      "kubernets.io/role/elb" = 1
  }
}

resource "aws_subnet" "priv1" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
      Name = "priv1A"
      "kubernets.io/cluster/eks" = "shared"
      "kubernets.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "priv2" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
      Name = "priv1B"
      "kubernets.io/cluster/eks" = "shared"
      "kubernets.io/role/internal-elb" = 1
  }
}