{ disko, ... }:

{
    imports = [ disko.nixosModules.disko ];

    disko.devices = {
        
        # Operating system (OS) 
        disk.sda = {
            type = "disk";
            device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_M.2_250GB_S413NB0K515812B";

            content = {
                type = "gpt";

                partitions = {
                    ESP = {
                        type = "EF00";
                        size = "1G";

                        content = {
                            type = "filesystem";
                            format = "vfat";
                            mountpoint = "/boot";
                            mountOptions = [ "umask=0077" ];
                        };
                    };

                    swap = {
                        size = "32G";

                        content = {
                            type = "swap";
                            resumeDevice = true;
                        };
                    };
                    
                    root = {
                        size = "100%";

                        content = {
                            type = "filesystem";
                            format = "ext4";
                            mountpoint = "/";
                        };
                    };
                };
            };
        };
    };
}