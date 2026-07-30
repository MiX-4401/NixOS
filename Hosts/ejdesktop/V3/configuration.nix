{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/V2/bootstrap.nix    # Import of the systems environment configurations
        ../../../Modules/Desktop/V3/bootstrap.nix   # Import of the desktop environment configurations
        
        # Host specific imports
        ./hardware-configuration.nix    # Import of the physical storage systems 
        ./virtualisation.nix            # Import of custom virtualisation configurations    
    ];

    # Core system modular settings
    
    # Security options
    core.system.security.hardenSudo.enable = true;
    core.system.security.hardenOpenSSH.enable = true;
    core.system.security.hardenOpenSSH.harden = true;
    core.system.security.hardenRoot.enable = true;
    core.system.security.hardenFirewall.enable = true;
    core.system.nix.allowUnfreeSoftware = true;
    core.system.nixos.hostname = "ejdesktop";
    core.system.nixos.garbageCollection.enable = true;
    core.system.nixos.garbageCollection.period = "daily";
    core.system.nixos.osVersion = "26.05";
    core.system.misc.gaming.enable = true;
    
    # Sleep & hibernation
    core.system.nixos.hibernation.enable = true;
    core.system.nixos.hibernation.hibernateDevice = "/dev/disk/by-uuid/3b56c352-90da-455f-964d-3d43564682c6";  # Do not need this one anymore
    core.system.nixos.hibernation.hibernateAfter = "10min";
    desktop.packages.hypridle.enable = true;
    desktop.packages.hypridle.lockAfter = 60;
    desktop.packages.hypridle.sleepAfter = 600;

    # Misc
    core.system.misc.wallpaper.filename = "rainworld12.png";

    # Core desktop modular settings

    # Default applications
    desktop.other.defaultApplications.browser = "zen.desktop";
    
    # Git
    desktop.packages.git.enable = true;
    desktop.packages.git.username = "MiX4401";
    desktop.packages.git.email = "ej.radford@outlook.com.au";

    # Hyprland
    desktop.packages.hyprland.monitors = [ 
        { output = "HDMI-A-1"; mode = "1920x1080@75"; position = "auto"; scale = 1.2; } 
        { output = "DP-1"; mode = "1920x1080@144"; position = "0x0"; scale = 1.2; }
    ];
    desktop.packages.hyprland.layout = "dwindle";
    desktop.packages.hyprland.sensitivity = -1.0;
    desktop.packages.hyprland.scrollFactor = 1.0;
    
    # Desktop package bundles
    desktop.bundles.office.enable   = true; 
    desktop.bundles.desktop.enable  = true; 
    desktop.bundles.gaming.enable   = true; 
    desktop.bundles.extra.enable    = true; 
    desktop.bundles.social.enable   = true; 

    # Host specific software
    environment.systemPackages = with pkgs; [
        microcode-amd
        rocmPackages.rocm-smi
        mdadm
        radeontop
    ];

    #boot.kernelPackages = pkgs.linuxPackages_zen;
}
