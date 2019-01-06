######## IGW ###############
resource "aws_internet_gateway" "terraform-blue-green-igw" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "terraform-blue-green-igw"
  }
}
