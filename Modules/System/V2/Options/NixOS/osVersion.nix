{ lib, config, ... }:

{
    options.core.system.nixos.osVersion = lib.mkOption {
        type = lib.types.str;
        description = "Set the NixOS version";
    };

    config = {
        system.stateVersion = config.core.system.nixos.osVersion;
    };
}