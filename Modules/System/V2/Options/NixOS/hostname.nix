{ username, lib, config, ... }:

{
    options.core.system.nixos.hostname = lib.mkOption {
        type = lib.types.str;
        default = "${username}";
        description = "Set a device hostname";
    };

    config = {
        networking.hostName = config.core.system.nixos.hostname;
    };
}