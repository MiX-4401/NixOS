{ inputs, config, pkgs, ... }:
# "/home/${username}/Pictures/Wallpapers/rainworld2.png"
{
    imports = [ 
        inputs.stylix.nixosModules.stylix 
    ];

    stylix = {
        enable = true;
        homeManagerIntegration.followSystem = true;
        
        polarity = "dark";
        image = config.desktopSetWallpaper.wallpaper;
        
        # cursor = {
        #     size = 12;
        #     name = "Breeze_Hacked";
        #     package = pkgs.breeze-hacked-cursor-theme;
        # };

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