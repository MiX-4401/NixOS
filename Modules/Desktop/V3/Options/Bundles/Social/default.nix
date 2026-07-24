{ lib, config, pkgs, ... }:

{
    options.desktop.bundles.social.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to socials";
    };

    config = lib.mkIf config.desktop.bundles.social.enable {
        home.packages = with pkgs; [
            discord
            spotify        
        ];
    };
}