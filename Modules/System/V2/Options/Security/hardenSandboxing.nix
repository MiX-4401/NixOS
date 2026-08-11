{ pkgs, lib, config, ... }:

{
    options.core.system.security.hardenSandboxing = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable sandboxing for applications";
        };
    };

    config = lib.mkIf config.core.system.security.hardenSandboxing.enable {

        # AppArmour

        security.apparmor = {
            enable = true;

            policies.htop = {
                state = "complain";
                profile = '' 
                    abi <abi/4.0>, 
                    include <tunables/global> 
                    profile ping-no-raw ${lib.getExe' pkgs.iputils "ping"} { 
                        include <abstractions/base> 
                        
                        # Allow ping to execute normally... 
                        ${lib.getExe' pkgs.iputils "ping"} rix, 
                        
                        # ...but don't allow it to use CAP_NET_RAW. 
                        deny capability net_raw, 
                    } 
                '';
            };
        };

        services.dbus.apparmor = "enabled";
    };
}