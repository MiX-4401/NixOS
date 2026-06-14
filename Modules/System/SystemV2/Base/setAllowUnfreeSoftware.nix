{ pkgs, lib, config, ... }:

{
    options.baseSetAllowUnfreeSoftware.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Allow unfree software";
    };

    config = {
        nixpkgs.config.allowUnfree = config.baseSetAllowUnfreeSoftware.enable;
    };
}