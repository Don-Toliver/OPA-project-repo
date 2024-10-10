terraform {
  backend "s3" {
    bucket         = "my-secure-bucket-ap-south-1-cicd"  # Replace with your actual S3 bucket name
    key            = "terraform.tfstate"
    region         = "ap-south-1"
  }
}
 
provider "aws" {
  region = "ap-south-1"
}
 
resource "aws_s3_bucket" "example" {
  bucket = "my-cicd-bucket-ap-south-1"
 
  tags = {
    Name        = "my-cicd-bucket-ap-south-1"
    Environment = "Test-Violation-2"
  }
}


