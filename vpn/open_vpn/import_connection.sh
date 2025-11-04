nmcli connection import type openvepn file sushant.ovpn
sudo systemctl restart NetworkManager
nmcli connection show
nmcli connection up sushant
nmcli connection show --active
