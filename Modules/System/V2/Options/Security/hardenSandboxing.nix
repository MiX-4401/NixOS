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

            policies = {
                
                # baseProfile.state = "enforce";
                # baseProfile.profile = ''
                #     abi <abi/4.0>,
                #     include <tunable/global>
                #     profile baseProfile ${lib.getExe pkgs.zen-browser} {
                #         include <abstractions/base>

                #         # Profile contents here
                #         flags=(unconfirmed)
                #     }
                # '';
            };
        };

        services.dbus.apparmor = "enabled";
    };
}