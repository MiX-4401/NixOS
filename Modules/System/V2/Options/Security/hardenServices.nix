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

        base = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ "sshd" ];
            description = "List of services to receive baseline systemd hardening"; 
        };
        
        strict = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ ];
            description = "List of services to receive strict systemd hardening"; 
        };
    };

    # Hardening sudo settings
    config = (
        map (name: hardenService { inherit name; profile = templateBaseline; }) config.core.system.security.hardenServices.base 
    );
}