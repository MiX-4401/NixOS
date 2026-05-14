{ inputs, pkgs, ... }:

{
    imports = [ inputs.stylix.nixosModules.stylix ];

    stylix = {
        enable = true;

        polarity = "dark";
        image = ../../Modules/Desktop/Wallpapers/rainworld2.png;

        homeManagerIntegration.followSystem = true;

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