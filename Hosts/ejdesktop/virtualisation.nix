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
  # VFIO / IOMMU (AMD GPU PASSTHROUGH CORE)
  ##########################################################################

  boot = {
    kernelParams = [
      # IOMMU
      "amd_iommu=on"
      "iommu=pt"

      # Bind GPU + HDMI audio to VFIO at boot
      "vfio-pci.ids=1002:731f,1002:ab38"

      # Prevent EFI framebuffer / early GPU takeover
      "video=efifb:off"
      "video=vesafb:off"
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
  # OPTIONAL: MINIMAL VM HOOK (ONLY STOPS DISPLAY MANAGER)
  ##########################################################################

  virtualisation.libvirtd.hooks.qemu = {
    win10-hook = pkgs.writeShellScript "win10-hook" ''
      set -e

      VM="$1"
      OP="$2"
      SUB="$3"

      if [ "$VM" = "win10" ] && [ "$OP" = "prepare" ] && [ "$SUB" = "begin" ]; then
        systemctl stop display-manager.service
      fi

      if [ "$VM" = "win10" ] && [ "$OP" = "release" ] && [ "$SUB" = "end" ]; then
        systemctl start display-manager.service
      fi
    '';
  };

  ##########################################################################
  # USEFUL PACKAGES
  ##########################################################################

  environment.systemPackages = with pkgs; [
    virt-manager
    OVMF
    dmidecode
  ];
}