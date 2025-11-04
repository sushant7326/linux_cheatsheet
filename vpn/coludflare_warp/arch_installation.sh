#!/bin/bash

# Install necessary dependencies
echo "Installing curl and base-devel..."
sudo pacman -S curl base-devel

# Install yay (if not already installed)
echo "Installing yay..."
sudo pacman -S yay

# Install Cloudflare WARP
echo "Installing Cloudflare WARP..."
yay -S cloudflare-warp-bin

# Start and enable WARP service
echo "Starting and enabling Cloudflare WARP service..."
sudo systemctl start warp-svc
sudo systemctl enable warp-svc

# Register WARP client
echo "Registering new WARP client..."
warp-cli registration new

# Connect to WARP
echo "Connecting to Cloudflare WARP..."
warp-cli connect

# Check WARP status
echo "Checking WARP status..."
warp-cli status
