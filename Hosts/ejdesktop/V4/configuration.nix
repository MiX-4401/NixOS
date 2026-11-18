{ lib, username, pkgs, pkgsUnstable, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/V2/bootstrap.nix    # Import of the systems environment configurations
        ../../../Modules/Desktop/V3/bootstrap.nix   # Import of the desktop environment configurations
        ./hardware-configuration.nix                # Import of the physical storage systems 

        # Host imports
        ./CoreConfigs/system.nix                    # Import of settings defining ../../Modules/System/[version]
        ./CoreConfigs/desktop.nix                   # Import of settings defining ../../Modules/Desktop/[version]
        #./OtherConfigs/virtualisation.nix           # Import of custom virtualisation configurations    
        #./OtherConfigs/yubikey.nix                  # Import of YubiKey settings
        ./OtherConfigs/hibernation.nix              # Import of hibernation settings
        #./OtherConfigs/disko-config.nix              # Import of Disko configs
        ./OtherConfigs/networking.nix               # Import of my custom networking settings
    ];

    ############################
    ## Host specific drop-ins ##
############################
    environment.systemPackages = [
      
        # Stable packages
        pkgs.microcode-amd   # AMD CPU security patches
        pkgs.mdadm           # Raid support
        pkgs.btrfs-progs     # Btrfs support
        # libXrender #unsure what this is for
        # faugus-launcher   # Would like to investigate and try this instead of bottles via flatpak
    
        # Unstable packages
        pkgsUnstable.bottles
    ];

    boot.kernelPackages = pkgs.linuxPackages_zen;
}