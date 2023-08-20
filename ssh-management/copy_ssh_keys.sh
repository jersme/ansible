#!/bin/bash

# Prompt for hostnames/IPs
HOSTS=($(osascript -e 'return text returned of (display dialog "Enter hostnames or IP addresses (comma-separated):" default answer "")' | tr ',' '\n'))

# Prompt for SSH user
USER=$(osascript -e 'return text returned of (display dialog "Enter SSH User:" default answer "pi")')

# Prompt for default password
PASSWORD=$(osascript -e 'return text returned of (display dialog "Enter default SSH password:" default answer "" with hidden answer)')

# Loop through each host and copy the SSH key
for HOST in "${HOSTS[@]}"; do
    # Bypass the fingerprint check
    ssh-keyscan -H $HOST >> ~/.ssh/known_hosts
    
    # Use SSH to copy the public key; we use sshpass to automate the password entry
    /opt/homebrew/bin/sshpass -p "$PASSWORD" ssh-copy-id $USER@$HOST
done
