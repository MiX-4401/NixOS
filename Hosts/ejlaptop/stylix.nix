{ inputs, pkgs, ... }:

{
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix.enable = true;

    stylix.homeManagerIntegration.followSystem = true;
    stylix.polarity = "dark";
    stylix.image = ../../Modules/Desktop/Wallpapers/rainworld2.png;
}