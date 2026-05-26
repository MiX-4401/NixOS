{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ly
        timeshift
        nethogs
        ncdu
        brightnessctl
        dosfstools
        ntfs3g
    ];

    programs = {
        git.enable = true;
        htop.enable = true;
        nano.enable = true;
        zsh.enable = true;
        hyprland.enable = true;
        steam.enable = true;
        gamescope.enable = true;
    };
}
