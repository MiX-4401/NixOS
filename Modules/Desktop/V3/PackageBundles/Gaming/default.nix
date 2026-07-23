{ lib, config, pkgs, ... }:

{
    options.desktopPackageBundleGaming.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to gaming";
    };

    config = lib.mkIf config.desktopPackageBundleGaming.enable {
        home.packages = with pkgs; [
            heroic
            prismlauncher
            wineWow64Packages.full
            winetricks
            # proton-ge-bin
        ];

        # programs.lutris = {
        #     enable = true;
        #     protonPackages = with pkgs; [
        #         proton-ge-bin
        #     ];
        #     winePackages = with pkgs; [
        #         wineWow64Packages.full
        #     ];
        # };
    };
}