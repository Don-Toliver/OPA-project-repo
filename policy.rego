package example

# Allow only the create action
allow {
    input.actions[_] == "create"
}

# Deny all other actions
deny {
    input.actions[_] != "create"
}

