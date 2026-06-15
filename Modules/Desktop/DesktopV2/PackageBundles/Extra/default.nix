{ lib, config, pkgs, ... }:

{
    options.desktopPackageBundleExtra.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to misc extra software for fun";
    };

    config = lib.mkIf config.desktopPackageBundleExtra.enable {
        home.packages = with pkgs; [
            neofetch
            cbonsai
            cmatrix
            cava
        ];
    };
}