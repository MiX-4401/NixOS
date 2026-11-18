{ lib, inputs, config, ... }:

{

    imports = [ inputs.flatpaks.homeModules.default ];
    options = {
        desktop.packages.hmFlatpak.enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable Flatpak via Declarative-Flatpak";
        };

        desktop.packages.hmFlatpak.packages = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "The list of packages to be installed";
        };

        desktop.packages.hmFlatpak.remotes = lib.mkOption {
            type = lib.types.attrs;
            default = { "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo"; };
            description = "The remote sources included";
        };
    };

    config = lib.mkIf config.desktop.packages.hmFlatpak.enable {

        # Using DeclaritiveFlatpak syntax
        services.flatpak.packages = config.desktop.packages.hmFlatpak.packages;
        services.flatpak.remotes = lib.mkMerge [ { "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo"; } config.desktop.packages.hmFlatpak.remotes ];
    };
}