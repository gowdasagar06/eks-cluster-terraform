#!/bin/sh
sudo apt update
curl -LO https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_linux_amd64.zip
sudo apt install unzip
unzip terraform_*.zip
sudo mv terraform /usr/local/bin/
sudo apt install awscli

# Make the script to abort if any command fails
set -e

# Print the commands as it is executed. Useful for debugging
set -x

aws --version
terraform --version
