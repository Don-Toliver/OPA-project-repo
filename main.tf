provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-secure-bucket-ap-south-1-cicd"

  tags = {
    Name        = "my-secure-bucket-ap-south-1-cicd"
    Environment = "Test-violation"
  }

}


