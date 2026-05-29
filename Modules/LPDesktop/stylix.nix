{ inputs, pkgs, wallpaper, ... }:

{
    imports = [ inputs.stylix.nixosModules.stylix ];

    stylix = {
        enable = true;
        homeManagerIntegration.followSystem = true;
        
        polarity = "dark";
        image = ./Wallpapers/${wallpaper};

        fonts = {
            serif = {
                package = pkgs.noto-fonts;
                name = "Noto Serif";
            };

            sansSerif = {
                package = pkgs.noto-fonts;
                name = "Noto Sans";
            };

            monospace = {
                package = pkgs.noto-fonts;
                name = "Noto Sans Mono";
            };

            emoji = {
                package = pkgs.noto-fonts;
                name = "Noto Emoji";
            };
        };
    };
}