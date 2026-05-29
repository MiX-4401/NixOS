{ pkgs, lib, ... }:

{
        home.pointerCursor = lib.mkForce {
                package = pkgs.breeze-hacked-cursor-theme;
                name = "Breeze_Hacked";
                enable = true;
                gtk.enable = true;
                x11.enable = true;
                size = 16;
        };

        xsession.pointCursor = {
                package = pkgs.breeze-hacked-cursor-theme;
                name = "Breeze_Hacked";
                size = 16;
        };
}
