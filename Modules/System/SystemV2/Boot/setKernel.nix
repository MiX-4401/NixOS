{ lib, config, pkgs, ... }:

{
    options.bootSystemdBoot.kernel = lib.mkOption {
        type = lib.types.str;
        default = "linux";
        description = "Set the default Linxu kernel";
    };

    
    config = {
        boot.kernelPackages =
        if config.bootSystemdBoot.kernel == "zen"
        then pkgs.linuxPackages_zen
        # else if config.bootSystemdBoot.kernel == " a different support kernel "
        # then pkgs.the other support kernel
        else pkgs.linuxPackages;
    };
}