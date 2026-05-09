{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ly
        timeshift
        nethogs
        btop
        ncdu
    ];

    programs = {
        git.enable = true;
        htop.enable = true;
        nano.enable = true;
    };
}