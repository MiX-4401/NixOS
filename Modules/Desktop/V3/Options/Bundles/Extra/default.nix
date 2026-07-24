{ lib, config, pkgs, ... }:

{
    options.desktop.bundles.extra.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to misc extra software for fun";
    };

    config = lib.mkIf config.desktop.bundles.extra.enable {
        home.packages = with pkgs; [
            fastfetch
            cbonsai
            cmatrix
            cava
        ];
    };
}