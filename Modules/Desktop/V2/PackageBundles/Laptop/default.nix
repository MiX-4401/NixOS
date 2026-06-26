{ lib, config, pkgs, ... }:

{
    options.desktopPackageBundleLaptopPackages.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to desktop utilities";
    };

    config = lib.mkIf config.desktopPackageBundleLaptopPackages.enable {
        home.packages = with pkgs; [
            jolt
        ];
    };
}