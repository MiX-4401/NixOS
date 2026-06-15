{ lib, config, pkgs, ... }:

{
    option.desktopPackageBundleGaming.enable = {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to gaming";
    };

    config = lib.mkIf config.desktopPackageBundleGaming.enable {
        home.packages = with pkgs; [
            lutris
            prismlauncher
        ];

        programs.steam.enable = true;
        programs.gamescope.enable = true;
    };
}