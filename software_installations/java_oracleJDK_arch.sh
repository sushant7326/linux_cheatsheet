#!/bin/bash

# Dont bother with this.
# Just install yay and install jdk with <yay -S jdk>
# Much faster than building the package
# I had written this script when I was under the impression
# "Dont install yay. Its just another package manager. It'd be bloat. You already have pacman."

sudo pacman -S yay --noconfirm
yay -S jdk --noconfirm

exit 0
# Didn't want to delete the script so exiting here

# Clone the JDK repository from AUR
echo "Cloning the JDK repository..."
git clone https://aur.archlinux.org/jdk.git

# Change to the JDK repository
cd jdk || { echo "Failed to change directory to JDK."; exit 1; }

# Function to check if a package is installed
is_installed() {
    pacman -Qq "$1" &>/dev/null
}

# Check and install base-devel (includes fakeroot)
if ! is_installed "base-devel"; then
    echo "Installing base-devel (includes fakeroot)..."
    sudo pacman -S --noconfirm base-devel
else
    echo "base-devel is already installed."
fi

# Build and install the package
echo "Building and installing JDK..."
makepkg -si --noconfirm

# Cleanup
cd ..
rm -rf jdk
echo "JDK installation completed"
