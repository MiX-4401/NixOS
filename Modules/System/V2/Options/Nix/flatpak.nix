{ pkgs, lib, config, ... }:

{
    options.core.system.nix.flatpak.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable Flatpak";
    };

    config = {
        services.flatpak.enable = true;
    };
}