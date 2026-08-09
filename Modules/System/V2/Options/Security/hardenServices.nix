{ lib, config, ... }:

let 
    templateBaseline = {
        NoNewPrivileges         = true;
        PrivateTmp              = true;
        ProtectSystem           = "full"; 
        ProtectHome             = true;
        ProtectKernelTunables   = true;
        ProtectKernelModules    = true;
        ProtectControlGroups    = true;
        RestrictSUIDSGID        = true;

    };

    templateStrict = {
        # ...
    };

    hardenService = { name, profile }: {
        systemd.services.${name}.serviceConfig = profile;
    };

in {
    options.core.system.security.hardenServices = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable custom systemd service hardening"; 
        };

        services = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ "sshd" ];
            description = "List of services to receive systemd hardening"; 
        };
    };

    config = lib.mkIf config.core.system.security.hardenServices.enable {
        systemd.services = lib.genAttrs
            config.core.system.security.hardenServices.services (_: {
                serviceConfig = templateBaseline;
            }
        );
    };
}