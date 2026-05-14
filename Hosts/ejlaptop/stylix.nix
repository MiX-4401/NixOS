{ pkgs, ... }:

{
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix.enable = true;

    stylix.image = ~/Pictures/Wallpapers/rainworld3.jpg;
}