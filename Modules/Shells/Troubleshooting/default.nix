{ pkgs, ... }:

pkgs.mkShell {
    packages = with pkgs; [
        nvme-cli        # nvme-cli
        smartmontools   # smartcl
        yubikey-manager # ykman
        pam_u2f         # pamu2fcfg
    ];
}

