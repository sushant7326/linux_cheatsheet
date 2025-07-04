#!/bin/bash
# Unable to access "SteamLibrary" 
# Error mounting /dev/nvme0n1p5 at /run/media/sushant/SteamLibrary: wrong fs type, bad option, bad superblock on /dev/nvme0n1p5, missing codepage or helper program, or other error

sudo mkdir -p /run/media/sushant/SteamLibrary   
sudo mount -t ntfs-3g /dev/nvme1n1p5 /run/media/sushant/SteamLibrary
sudo ntfsfix /dev/nvme1n1p5
