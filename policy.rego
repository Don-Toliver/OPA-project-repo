package s3.access
 
# Default rule to deny all actions
default allow = false
 
# Allow all actions except for updating tags on the specified bucket
allow {
    input.action != "update_tags"
}
 
# Deny tag updates for the specific bucket
deny {
    input.action == "update_tags"
    input.bucket == "my-secure-bucket-ap-south-1-cicd"
}
