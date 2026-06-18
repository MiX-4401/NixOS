{ pkgs, lib, ... }:

{
    home.packages = [ pkgs.breeze-hacked-cursor-theme ];
    home.pointerCursor = lib.mkForce {
        package = pkgs.breeze-hacked-cursor-theme;
        name = "Breeze_Hacked";
        enable = true;
        gtk.enable = true;
        x11.enable = true;
        size = 24;
    };
}