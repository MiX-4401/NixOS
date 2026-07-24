{ lib, config, pkgs, ... }:

{
    options.desktop.bundles.office.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to the office suite";
    };

    config = lib.mkIf config.desktop.bundles.office.enable {
        home.packages = with pkgs; [
            gimp
            libreoffice
        ];
    };
}