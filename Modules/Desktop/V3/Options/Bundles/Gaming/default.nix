{ lib, config, pkgs, ... }:

{
    options.desktop.bundles.gaming.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to gaming";
    };

    config = lib.mkIf config.desktop.bundles.gaming.enable {
        home.packages = with pkgs; [
            heroic
            modrinth-app
            wineWow64Packages.full
            winetricks
            bottles
        ];
    };
}