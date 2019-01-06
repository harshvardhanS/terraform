
provider "aws" {
    shared_credentials_file = "./secretefile/terraformKey"
    region = "${var.aws_region}"
}

terraform {
    backend "s3" {
        encrypt = true
        bucket = "terraform-bluegreen-bucket"
        region  = "us-east-1"
        key     = "v1"

    }
}