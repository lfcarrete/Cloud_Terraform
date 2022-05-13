resource "aws_vpc" "tf_vpc" {
    cidr_block       = "192.168.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "tf_vpc"
    }
}
output "vpc_id" {
    value =  aws_vpc.tf_vpc.id
    description = "vpc_id"
    sensitive = false
  
}