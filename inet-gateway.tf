######## IGW ###############
data "aws_internet_gateway" "terraform-blue-green-igw" {
  filter {
    name   = "attachment.vpc-id"
    values = ["${var.vpc_id}"]
  }
}