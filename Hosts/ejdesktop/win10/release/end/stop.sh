#!/bin/bash
set -x

## Unload vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

virsh nodedev-reattach pci_0000_2b_00_0
virsh nodedev-reattach pci_0000_2b_00_1

# Rebind VT consoles
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

nvidia-xconfig --query-gpu-info > /dev/null 2>&1
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

modprobe amdgpu

# Restart Display Manager
systemctl start display-manager.service
