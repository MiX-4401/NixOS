{ lib, config, ... }:

let 
    templateBaseline = {

        # My configuration
        NoNewPrivileges         = true;
        PrivateTmp              = true;
        ProtectSystem           = "full"; 
        ProtectHome             = true;
        ProtectKernelTunables   = true;
        ProtectKernelModules    = true;
        ProtectControlGroups    = "strict";
        RestrictSUIDSGID        = true;

        # NixOS wiki suggestions (https://wiki.nixos.org/wiki/Systemd/Hardening?utm_source=chatgpt.com#Hardened_service_unit_example)
        CapabilityBoundingSet = "";
        SystemCallArchitectures = "native";
        RestrictAddresFamilies = [
            "AF_UNIX" # Unix sockets
            "AF_INET" # ipv4
            "AF_INET6" # ipv6
        ];
        SocketBindDeny = "any";
        SystemCallErrorNumber = "EPERM";   
        SystemCallFilter = [
            "@system-service"
        ];
        ProtectProc = "invisible";
        UMask = "0007";
        SystemCallArchitectures = "native";
        LockPersonality = true;
        PrivateMounts = true;
        PrivateDevices = true;
        PrivateIPC = true;
        PrivatePIDs = true;
        PrivateUsers = true;
        ProtectClock = true;
        ProtectKernelLogs = true;
        RestrictNamespaces = true;
        MemoryDenyWriteExecute = true;
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
            default = [ ];
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