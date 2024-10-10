package example.s3
 
# Define the allowed tags for the S3 bucket
allowed_tags = {"Name": "my-cicd-bucket-ap-south-1", "Environment": "Test-violation-2"}
 
# Deny any request that attempts to change the S3 bucket's tags
violation[msg] {
  input.resource.type == "aws_s3_bucket"
  input.resource.change.type == "update"
  input.resource.change.after.tags != input.resource.change.before.tags
  msg = sprintf("Changing tags is not allowed for S3 bucket: %s", [input.resource.id])
}
 
# Allow only the creation of the bucket
allow {
  input.action == "s3:CreateBucket"
}
