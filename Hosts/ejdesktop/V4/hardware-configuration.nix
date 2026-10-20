{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "ahci" "xhci_pci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" "dm-cache" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.swraid.enable = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ee835a3b-8595-457e-8e8d-3dc52e317c7c";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7F29-2359";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  fileSystems."/media/GA" =
    { device = "/dev/mapper/root-origin";
      fsType = "btrfs";
      options = [ "subvol=GA" "defaults" "nofail" ];
    };

  fileSystems."/media/OT" =
    { device = "/dev/mapper/root-origin";
      fsType = "btrfs";
      options = [ "subvol=OT" "defaults" "nofail" ];
    };

  fileSystems."/media/BU" =
    { device = "/dev/mapper/root-origin";
      fsType = "btrfs";
      options = [ "subvol=BU" "defaults" "nofail" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/81e9d1db-bebb-46d7-a324-b2d05717ab6b"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
