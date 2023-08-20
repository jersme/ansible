#!/bin/bash

IPs=$(osascript -e 'return text returned of (display dialog "Enter IP addresses to remove from known_hosts (comma-separated):" default answer "")')

IFS=',' read -ra ADDR <<< "$IPs"
for ip in "${ADDR[@]}"; do
    ssh-keygen -R $ip
done
