{ lib, config, pkgs, ... }:

{
    option.desktopPackageBundleOfficeUtilities.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to the office suite";
    };

    config = lib.mkIf config.desktopPackageBundleOfficeUtilities.enable {
        home.packages = with pkgs; [
            gimp
        ];
    };
}