provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "automation-cicd-pro-ap-south-1"

  tags = {
    Name        = "automation-cicd-bucket-violation-check"
    Environment = "Test"
  }

}


