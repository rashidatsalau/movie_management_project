
#VPC of Talent_Academy Lab account
data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

#Public Subnet
data "aws_subnet" "Public_3" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_3_name]
  }
}

#AMI FOR AMAZON LINUX

data "aws_ami" "amz_linux_image" {
  most_recent = true
  owners      = [var.amzn_ami_owner]
  filter {
    name   = "name"
    values = [var.amzn_ami_name]
  }

}

