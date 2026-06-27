{ pkgs, lib, config, ... }:

{
    options.core.system.nix.allowUnfreeSoftware = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Allow unfree software";
    };

    config = {
        nixpkgs.config.allowUnfree = config.core.system.nix.allowUnfreeSoftware;
    };
}
