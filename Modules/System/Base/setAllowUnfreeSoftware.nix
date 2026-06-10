{ pkgs, lib, config, ... }:

{
    options = {
        BaseSetAllowUnfreeSoftware.enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Allow unfree software";
        };
    };

    config = {
        nixpkgs.config.allowUnfree = config.BaseSetAllowUnfreeSoftware;
    };
}