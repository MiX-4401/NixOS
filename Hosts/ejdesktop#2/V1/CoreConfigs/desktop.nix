{ config, ... }:

{
    # desktop.other options
    desktop.other.defaultApplications.browser = "zen.desktop";
    
    # desktop.packages options
    desktop.packages.git.enable = true;
    desktop.packages.git.username = "MiX4401";
    desktop.packages.git.email = "ej.radford@outlook.com.au";

    desktop.packages.hyprland.monitors = [ 
        { output = "HDMI-A-1"; mode = "1920x1080@75"; position = "auto"; scale = 1.2; } 
        { output = "DP-1"; mode = "1920x1080@144"; position = "0x0"; scale = 1.2; }
    ];
    desktop.packages.hyprland.layout = "dwindle";
    desktop.packages.hyprland.sensitivity = -1.0;
    desktop.packages.hyprland.scrollFactor = 1.0;
    
    # desktop.bundles options
    desktop.bundles.office.enable   = true; 
    desktop.bundles.desktop.enable  = true; 
    desktop.bundles.gaming.enable   = true; 
    desktop.bundles.extra.enable    = true; 
    desktop.bundles.social.enable   = true; 
    desktop.bundles.troubleshooting.enable = true;
}