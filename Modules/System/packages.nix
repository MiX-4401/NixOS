{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ly
        timeshift
        nethogs
        btop
        ncdu
        home-manager
    ];

    programs = {
        git.enable = true;
        htop.enable = true;
        nano.enable = true;
        zsh.enable = true;
    };
}