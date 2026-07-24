{ lib, config, pkgs, ... }:

{
    options.desktop.bundles.laptop.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to desktop utilities";
    };

    config = lib.mkIf config.desktop.bundles.laptop.enable {
        home.packages = with pkgs; [
            jolt
        ];
    };
}