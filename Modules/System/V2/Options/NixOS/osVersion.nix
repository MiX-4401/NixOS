{ lib, config, ... }:

{
    options.core.system.nixos.osVersion = lib.mkOption {
        type = lib.types.str;
        default = "26.05";
        description = "Set the NixOS version";
    };

    config = {
        system.stateVersion = config.core.system.nixos.osVersion;
    };
}