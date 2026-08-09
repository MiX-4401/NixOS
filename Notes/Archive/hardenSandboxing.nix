{ pkgs, lib, config, ... }:

{
    options.core.system.security.hardenSandboxing = {

        # Firejail sandboxing
        apparmour.enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable apparmour"; 
        };

        bubblewrap.enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable bubblewrap"; 
        };
    };

    config = {

        environment.systemPackages = with pkgs; [
            bubblewrap
        ];
        
    };
}

# Nix-Bwrapper
# NixPak
# NixJail
