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

    hardenService = {name, profile }: {
        systemd.services.${name}.serviceConfig = profile;
    };

in {
    options.core.system.security.hardenServices = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable custom systemd service hardening"; 
        };

        base = lib.mkOption {
            type = lib.types.listOf lib.types.sets;
            default = [ ];
            description = "List of services to receive baseline systemd hardening"; 
        };
        
        strict = lib.mkOption {
            type = lib.types.listOf lib.types.sets;
            default = [ ];
            description = "List of services to receive strict systemd hardening"; 
        };
    };

    # Hardening sudo settings
    config = lib.mkIf config.core.system.security.hardenServices.enable
        lib.mkMerge [
            (map (name: hardenService name templateBaseline) config.core.system.security.hardenServices.base)
            (map (name: hardenService name templateStrict) config.core.system.security.hardenServices.strict)
        ];
    }
