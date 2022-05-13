resource "aws_internet_gateway" "interner_gateway_tf" {
    vpc_id = aws_vpc.tf_vpc.id
    tags = {
        Name = "interner_gateway_tf"
    }
}