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

            policies.ping = {
                state = "complain";
                profile  = ''
                    profile ping ${lib.getExe pkgs.ping} {
                        deny capability net_raw,
                    }
                '';
            };
        };

        services.dbus.apparmor = "enabled";
    };
}