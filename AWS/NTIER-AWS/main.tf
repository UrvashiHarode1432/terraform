resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.name
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.subnet_cidr_ranges)
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = var.subnet_cidr_ranges[count.index]
  tags = {
    Name = var.subnet_name[count.index]
  }

  depends_on = [aws_vpc.ntier_vpc]
}

# resource "aws_subnet" "subnet_using_format_function" {
#   count  = length(var.subnet_name_format_function)
#   vpc_id = aws_vpc.ntier_vpc.id
#   # --------how format function works -------
#   # format(var.subnet_cidr_format,count.index)
#   # suppose count.index = `2`
#   # "10.10.`2`.0/24"
#   cidr_block = format(var.subnet_cidr_format, count.index)
#   tags = {
#     Name = var.subnet_name_format_function[count.index]
#   }

#   depends_on = [aws_vpc.ntier_vpc]
# }

resource "aws_subnet" "subnet_using_cidrsubnet_function" {
  count      = length(var.subnet_name)
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = cidrsubnet(var.vpc_network_cidr, 8, count.index)
  tags = {
    Name = var.subnet_name_cidr_function[count.index]
  }

  depends_on = [aws_vpc.ntier_vpc]
}
