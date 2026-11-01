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
        #./OtherConfigs/virtualisation.nix           # Import of custom virtualisation configurations    
        #./OtherConfigs/yubikey.nix                  # Import of YubiKey settings
        ./OtherConfigs/hibernation.nix              # Import of hibernation settings
        #./OtherConfigs/disko-config.nix              # Import of Disko configs
        # ./OtherConfigs/networking.nix               # Import of my custom networking settings
    ];

    ############################
    ## Host specific drop-ins ##
    ############################
    environment.systemPackages = with pkgs; [
        microcode-amd
        mdadm
        jdk17
        libXrender
        btrfs-progs
    ];

    boot.kernelPackages = pkgs.linuxPackages_zen;

    # services.webdav = {
    #     enable = true;
    #     settings.address = "192.168.5.108";
    #     settings.port = "5001";
    #     settings.directory = "/media/test";
    #     settings.users = {
    #         username = "ethanr";
    #         password = "++32=Deep=Shown=Movement=80++";
    #     };
    # };
}