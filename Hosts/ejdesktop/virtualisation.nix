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

    # virtualisation.libvirtd.hooks.qemu = {
    #     win10 = {
    #         prepare = {
    #             begin = pkgs.writeShellScript "Prepare-begin" ''
    #                 ## Helpful to read output when debugging
    #                 set -x

    #                 # Stop display manager
    #                 systemctl stop display-manager.service
    #                 ## Uncomment the following line if you use GDM
    #                 #killall gdm-x-session

    #                 # Unbind VTconsoles
    #                 echo 0 > /sys/class/vtconsole/vtcon0/bind
    #                 echo 0 > /sys/class/vtconsole/vtcon1/bind

    #                 # Unbind EFI-Framebuffer
    #                 echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

    #                 # Avoid a Race condition by waiting 2 seconds. This can be calibrated to be shorter or longer if required for your system
    #                 sleep 2

    #                 # Unload all AMD  drivers
    #                 modprobe -r amdgpu

    #                 virsh nodedev-detach pci_0000_2b_00_0
    #                 virsh nodedev-detach pci_0000_2b_00_1

    #                 ## Load vfio
    #                 modprobe vfio
    #                 modprobe vfio_iommu_type1
    #                 modprobe vfio_pci
    #             '';
    #         };

    #         release = {
    #             end = pkgs.writeShellScript "release-end" ''
    #                 set -x

    #                 ## Unload vfio
    #                 modprobe -r vfio_pci
    #                 modprobe -r vfio_iommu_type1
    #                 modprobe -r vfio

    #                 virsh nodedev-reattach pci_0000_2b_00_0
    #                 virsh nodedev-reattach pci_0000_2b_00_1

    #                 # Rebind VT consoles
    #                 echo 1 > /sys/class/vtconsole/vtcon0/bind
    #                 echo 1 > /sys/class/vtconsole/vtcon1/bind

    #                 echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

    #                 modprobe amdgpu

    #                 # Restart Display Manager
    #                 systemctl start display-manager.service

    #             '';
    #         };
    #     };
    # };

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