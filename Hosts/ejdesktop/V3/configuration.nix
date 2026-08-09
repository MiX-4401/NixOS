{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/V2/bootstrap.nix    # Import of the systems environment configurations
        ../../../Modules/Desktop/V3/bootstrap.nix   # Import of the desktop environment configurations
        ./hardware-configuration.nix                # Import of the physical storage systems 

        # Host imports
        ./CoreConfigs/system.nix                    # Import of settings defining ../../Modules/System/[version]
        ./CoreConfigs/desktop.nix                   # Import of settings defining ../../Modules/Desktop/[version]
        ./OtherConfigs/virtualisation.nix            # Import of custom virtualisation configurations    
        ./OtherConfigs/yubikey.nix                   # Import of YubiKey settings
        # ./OtherConfigs/disko-config.nix              # Import of Disko configs
    ];

    ############################
    ## Host specific drop-ins ##
    ############################
    environment.systemPackages = with pkgs; [
        microcode-amd
        rocmPackages.rocm-smi
        mdadm
        radeontop
    ];

    # boot.kernelPackages = pkgs.linuxPackages_zen;

    # Hibernation settings
    # config.core.mySystem.nixos.hibernation.enable = true;
    # config.core.system.nixos.hibernation.hibernateDevice = "/dev/disk/by-uuid/3b56c352-90da-455f-964d-3d43564682c6";  # Do not need this one anymore
    # config.core.system.nixos.hibernation.hibernateAfter = "10min";
    # config.desktop.packages.hypridle.enable = true;
    # config.desktop.packages.hypridle.lockAfter = 60;
    # config.desktop.packages.hypridle.sleepAfter = 600;
}
