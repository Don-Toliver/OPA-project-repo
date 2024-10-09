provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "automation-cicd-pro-ap-south-1-pzrctulv"
  
  # Add tags for the bucket
  tags = {
    Name        = "automation-cicd-bucket"
    Environment = "DEV"
  }

  # Optional: ACL settings for the bucket (private, public-read, etc.)
  acl = "private"
}

