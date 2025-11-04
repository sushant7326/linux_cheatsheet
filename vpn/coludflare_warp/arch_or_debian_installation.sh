#!/bin/bash

# Detect package manager
if command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
    INSTALL_CMD="sudo pacman -S --noconfirm"
    UPDATE_CMD="sudo pacman -Syu --noconfirm"
    AUR_HELPER="yay -S --noconfirm"
elif command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
    INSTALL_CMD="sudo apt install -y"
    UPDATE_CMD="sudo apt update && sudo apt upgrade -y"
    AUR_HELPER="echo 'AUR not available on Debian-based distros'"
else
    echo "Unsupported package manager. Exiting..."
    exit 1
fi

# Update the system
echo "Updating system packages..."
$UPDATE_CMD

# Install necessary dependencies
echo "Installing curl and base-devel..."
$INSTALL_CMD curl
if [ "$PKG_MANAGER" = "pacman" ]; then
    $INSTALL_CMD base-devel
elif [ "$PKG_MANAGER" = "apt" ]; then
    $INSTALL_CMD build-essential
fi

# Install yay if Arch-based
echo "Installing yay..."
if [ "$PKG_MANAGER" = "pacman" ]; then
    $INSTALL_CMD yay
fi

# Install Cloudflare WARP
echo "Installing Cloudflare WARP..."
if [ "$PKG_MANAGER" = "pacman" ]; then
    $AUR_HELPER cloudflare-warp-bin
elif [ "$PKG_MANAGER" = "apt" ]; then
    curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo tee /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
    $UPDATE_CMD
    $INSTALL_CMD cloudflare-warp
fi

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

