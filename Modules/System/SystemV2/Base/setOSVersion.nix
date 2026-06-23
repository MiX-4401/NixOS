{ lib, config, ... }:

{
    options.baseSetOSVersion.version = lib.mkOption {
        type = lib.types.str;
        description = "Set the NixOS version";
    };

    config = {
        system.stateVersion = config.baseSetOSVersion.version;
    };
}