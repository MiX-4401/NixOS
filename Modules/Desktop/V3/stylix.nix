{ inputs, config, pkgs, ... }:
# "/home/${username}/Pictures/Wallpapers/rainworld2.png"
{
    imports = [ 
        inputs.stylix.nixosModules.stylix 
    ];

    stylix = {
        enable = true;
        homeManagerIntegration.followSystem = true;
        
        # Force system and application colours to depend on a generated pallet from the specified wallpaper image
        polarity = "dark";
        image = ./Wallpapers/${config.core.system.misc.wallpaper.filename};

        # Force system and application wide fonts
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