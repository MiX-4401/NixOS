{ lib, config, ... }:

{

    imports = [ inputs.flatpaks.homeModules.default ];
    options = {
        desktop.packages.flatpak.enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable Flatpak via Declarative-Flatpak";
        };

        desktop.packages.flatpak.packages = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "The list of packages to be installed";
        };

        desktop.packages.flatpak.remotes = lib.mkOption {
            type = lib.types.listOf lib.types.attrs;
            default = {};
            description = "The remote sources included";
        };
    };

    config = lib.mkIf config.desktop.packages.flatpak.enable {

        # Using DeclaritiveFlatpak syntax
        services.flatpak.packages = config.desktop.packages.flatpak.packages;
        services.flatpak.remotes = config.desktop.packages.flatpak.remotes;
    };
}