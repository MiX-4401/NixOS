{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ly
        timeshift
        htop
        home-manager
    ];

    programs = {
        git.enable = true;
        htop.enable = true;
        nano.enable = true;
        zsh.enable = true;
        hyprland.enable = true;
    };
}