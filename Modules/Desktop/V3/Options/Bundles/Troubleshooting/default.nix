{ lib, config, pkgs, ... }:

{
    options.desktop.bundles.troubleshooting.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to troubleshooting";
    };

    config = lib.mkIf config.desktop.bundles.troubleshooting.enable {
        home.packages = with pkgs; [
            nvme-cli        # nvme-cli
            smartmontools   # smartcl
            yubikey-manager # ykman
            pam-u2f         # pamu2fcfg
        ];
    };
}