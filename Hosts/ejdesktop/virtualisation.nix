{ pkgs, username, ... }:

{
  ##########################################################################
  # LIBVIRT / VIRT-MANAGER
  ##########################################################################

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ username ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        runAsRoot = true;
        swtpm.enable = true;
      };
    };

    spiceUSBRedirection.enable = true;
  };

  ##########################################################################
  # VFIO SUPPORT (NO STATIC GPU BINDING)
  ##########################################################################

  boot = {
    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
    ];

    initrd.kernelModules = [
      "vfio"
      "vfio_pci"
      "vfio_iommu_type1"
    ];

    kernelModules = [
      "kvm-amd"
    ];
  };

  ##########################################################################
  # GPU SWITCH HOOK (CRITICAL PART)
  ##########################################################################

  virtualisation.libvirtd.hooks.qemu = {
    win10-hook = pkgs.writeShellScript "win10-hook" ''
      set -e

      VM="$1"
      OP="$2"
      SUB="$3"

      GPU="0000:2b:00.0"
      AUDIO="0000:2b:00.1"

      case "$OP:$SUB" in

        prepare:begin)
          echo "Stopping display manager..."
          systemctl stop display-manager.service

          echo "Unbinding GPU from amdgpu..."

          # Detach console cleanly
          echo 0 > /sys/class/vtconsole/vtcon0/bind || true
          echo 0 > /sys/class/vtconsole/vtcon1/bind || true

          echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind || true

          # Unbind AMD driver
          if [ -e /sys/bus/pci/devices/$GPU/driver ]; then
            echo $GPU > /sys/bus/pci/devices/$GPU/driver/unbind
          fi

          if [ -e /sys/bus/pci/devices/$AUDIO/driver ]; then
            echo $AUDIO > /sys/bus/pci/devices/$AUDIO/driver/unbind
          fi

          sleep 1

          # Bind to VFIO
          echo 1002 731f > /sys/bus/pci/drivers/vfio-pci/new_id || true
          echo 1002 ab38 > /sys/bus/pci/drivers/vfio-pci/new_id || true
        ;;

        release:end)
          echo "Releasing GPU back to host..."

          # Remove vfio binding
          echo $GPU > /sys/bus/pci/drivers/vfio-pci/unbind || true
          echo $AUDIO > /sys/bus/pci/drivers/vfio-pci/unbind || true

          echo 1002 731f > /sys/bus/pci/drivers/vfio-pci/remove_id || true
          echo 1002 ab38 > /sys/bus/pci/drivers/vfio-pci/remove_id || true

          # Rebind AMDGPU
          modprobe amdgpu || true

          echo $GPU > /sys/bus/pci/drivers/amdgpu/bind || true
          echo $AUDIO > /sys/bus/pci/drivers/snd_hda_intel/bind || true

          # Restore framebuffer + console
          echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/bind || true

          echo 1 > /sys/class/vtconsole/vtcon0/bind || true
          echo 1 > /sys/class/vtconsole/vtcon1/bind || true

          systemctl start display-manager.service
        ;;
      esac
    '';
  };

  ##########################################################################
  # PACKAGES
  ##########################################################################

  environment.systemPackages = with pkgs; [
    virt-manager
    OVMF
    dmidecode
  ];
}