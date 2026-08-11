{ lib, config, ... }:

{
    options.core.system.security.hardenAuditing = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable auditing";
        };

        # monitor = lib.mkOption {
        #     type = lib.types.listOf lib.types.str;
        #     default = [ "/etc/nixos" ];
        #     description = "A list of monitored paths";
        # };
    };

    # Hardening firewall settings
    config = lib.mkIf config.core.system.security.hardenAuditing.enable {
        
        services.journald.audit = true;
        security.auditd.enable = true;
        security.audit = {
            enable = true;
            rules = [

                # Log changes to important files
                "-w /etc/passwd -p wa -k passwd_changes"
                "-w /etc/shadow -p wa -k shadow_changes"
                "-w /etc/sudoers -p wa -k sudoers_changes"
                "-w /etc/resolve.conf -p wa -k resolve_changes"

                # Log changes to important directories"
                "-w /etc/nixos/ -p wa -k nixosConfig_changes"

                # Log access denied events
                "-a always,exit -F arch=b64 -S open,openat -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access_denied"
                "-a always,exit -F arch=b64 -S open,openat -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access_denied"

                # Log file creation events
                # "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rmdir -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k user_deletedFile"

                # Log file deletion events
                # "-a always,exit -F arch=b64 -S creat -S open -S openat -S unlinkat -F auid>=1000 -F auid!=4294967295 -k user_createdFile"

            ];
        };
    };
}