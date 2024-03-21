#!/usr/bin/env bash

# NOTE: Ansible

echo 'Installing Ansible'

packages=("ansible" "ansible-core" "httpd" "ansible-doc" "ansible-core-doc")

for package in "${packages[@]}"; do
  if dnf list installed "$package" &>/dev/null; then
    echo "Package $package found. Skipping installation."
  else
    if sudo dnf install -y "$package" &>/dev/null; then
      echo "Package $package installed successfully."
    else
      echo "Failed to install package $package."
    fi
  fi
done