## Install Packages
```bash
sudo pacman -S qemu-full libvirt virt-manager dnsmasq iptables edk2-ovmf
```

- qemu-full : Runs virtual machines and emulates hardware
- libvirt : Manages VMs networks and storage
- virt-manager : GUI for creating and managing VMs
- dnsmasq : DHCP abd DNS for the default virtual network
- iptables : Firewall backend used by libvirt networking
- edk2-ovmf : UEFI firmware for virtual machines

## Check hardware virtualization

```bash
lscpu | grep -i virtualization
```

```bash
lsmod | grep kvm
```

## Enable `libvirt`
```bash
sudo systemctl enable --now libvirtd.socket

# check the status
systemctl status libvirtd.socket
```

## Config user account
```bash
sudo usermod -aG libvirt "$USER"

# verify
getent group libvirt
```

## Start virtual network
```bash
sudo virsh net-start default
sudo virsh net-autostart default

# verify
sudo virsh net-list --all
```

## Launch virt-manager
```bash
virt-manager
```

