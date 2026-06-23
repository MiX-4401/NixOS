{ lib, config, pkgs, username, ... }:

{
    options.desktopPackageBundleSocials.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to socials";
    };

    config = lib.mkIf config.desktopPackageBundleSocials.enable {
        home.packages = with pkgs; [
            discord
            spotify        
        ];
    };
}