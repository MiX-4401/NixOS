{ inputs, pkgs, ... }:

{
    imports = [ inputs.stylix.homeModules.stylix ];

    stylix = {
        enable = true;

        polarity = "dark";
        
        image = builtins.getEnv "WALLPAPER";

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