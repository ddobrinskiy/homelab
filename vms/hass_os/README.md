- download vm qcow2 image from https://www.home-assistant.io/installation/linux


- install deps

```bash
# Install virtualization stack
sudo pacman -S qemu-base virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat

# Enable and start services
sudo systemctl enable --now libvirtd

# Add your user to the libvirt group
sudo usermod -aG libvirt $(whoami)
newgrp libvirt
```