#!/bin/bash

# Update package list and install necessary packages
sudo yum update -y
sudo yum install -y wget unzip java-11-openjdk

# Set Terraform version
TERRAFORM_VERSION="1.5.6"  # Change this to the desired version

# Download Terraform
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Unzip the downloaded file
unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Move the Terraform binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Clean up the zip file
rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Verify installation
terraform version

# Add Jenkins user to the sudoers file
if ! sudo grep -q '^jenkins ALL=(ALL) NOPASSWD: ALL' /etc/sudoers; then
    echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers
fi

# Install Jenkins
echo "Installing Jenkins..."
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check Jenkins status
if systemctl status jenkins | grep -q 'active (running)'; then
    echo "Jenkins is up and running!"
else
    echo "Jenkins failed to start."
fi

# Install OPA
echo "Installing Open Policy Agent (OPA)..."
wget -O opa https://github.com/open-policy-agent/opa/releases/latest/download/opa_linux_amd64
sudo mv opa /usr/local/bin/
sudo chmod 755 /usr/local/bin/opa

# Verify OPA installation
opa version

echo "Terraform, Jenkins, and OPA installation completed."

