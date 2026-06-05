{ pkgs, username, ... }:

{
    programs.virt-manager.enable = true;
    
    users.groups.libvirtd.members = [ username ];

    virtualisation.libvirtd = {
        enable = true;
    };

    virtualisation.spiceUSBRedirection = {
        enable = true;
    };

    virtualisation.libvirtd.hooks.qemu = {
        win10-hook = pkgs.writeShellScript "win10-hook" ''
            set -ex

            VM="$1"
            OPERATION="$2"
            SUBOPERATION="$3"

            if [ "$VM" = "win10" ] &&
            [ "$OPERATION" = "prepare" ] &&
            [ "$SUBOPERATION" = "begin" ]; then

            systemctl stop display-manager.service

            echo 0 > /sys/class/vtconsole/vtcon0/bind || true
            echo 0 > /sys/class/vtconsole/vtcon1/bind || true

            echo efi-framebuffer.0 \
                > /sys/bus/platform/drivers/efi-framebuffer/unbind

            sleep 2

            modprobe -r amdgpu

            virsh nodedev-detach pci_0000_2b_00_0
            virsh nodedev-detach pci_0000_2b_00_1

            modprobe vfio
            modprobe vfio_iommu_type1
            modprobe vfio_pci
            fi

            if [ "$VM" = "win10" ] &&
            [ "$OPERATION" = "release" ] &&
            [ "$SUBOPERATION" = "end" ]; then

            modprobe -r vfio_pci
            modprobe -r vfio_iommu_type1
            modprobe -r vfio

            virsh nodedev-reattach pci_0000_2b_00_0
            virsh nodedev-reattach pci_0000_2b_00_1

            echo 1 > /sys/class/vtconsole/vtcon0/bind || true
            echo 1 > /sys/class/vtconsole/vtcon1/bind || true

            echo efi-framebuffer.0 \
                > /sys/bus/platform/drivers/efi-framebuffer/bind

            modprobe amdgpu

            systemctl start display-manager.service
            fi
        '';
    };

    boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" ];
    boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ];

    environment.systemPackages = with pkgs; [
        dmidecode
        OVMF
        # dnsmasq
        # iptables
    ];
}