{ lib, config, pkgs, ... }:

{
    options.desktopPackageBundleGaming.enable = lib.mkOption {
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
        # programs.gamemode.enable = true;
        programs.gamescope.enable = true;
        programs.steam.gamescopeSession.enable = true;
    };
}