package s3_policy

# Define the allowed action
allowed_action = "s3:CreateBucket"

# Deny any request that is not a CreateBucket operation
deny[msg] {
  input.action != allowed_action
  msg = sprintf("Operation '%s' is denied. Only 's3:CreateBucket' is allowed.", [input.action])
}
