############# Route Tables ##########
resource "aws_route_table" "terraform-blue-green-public-rt" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform-blue-green-igw.id}"
  }

  tags {
    Name = "terraform-blue-green-public-rt (v${var.infrastructure_version})"
  }
}

######### PUBLIC Subnet assiosation with rotute table    ######
resource "aws_route_table_association" "public-assoc-1" {
  count = "${local.subnet_count}"
  subnet_id      = "${element(local.subnets, count.index)}"
  route_table_id = "${aws_route_table.terraform-blue-green-public-rt.id}"
}