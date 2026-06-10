{ pkgs, lib, config, ... }:

{
    options = {
        BaseSetAllowUnfreeSoftware = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Allow unfree software";
        };
    };

    config = {
        nixpkgs.config.allowUnfree = config.BaseSetAllowUnfreeSoftware;
    };
}