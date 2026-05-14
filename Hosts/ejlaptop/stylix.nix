{ inputs, pkgs, ... }:

{
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix.enable = true;

    stylix.targets.hyprland.enable = false;

    stylix.homeManagerIntegration.followSystem = true;

    stylix.image = ../../Modules/Desktop/Wallpapers/rainworld2.png;
}