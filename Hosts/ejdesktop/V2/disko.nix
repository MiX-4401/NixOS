{ disko, ... }:

# Device         Start       End   Sectors   Size Type
# /dev/sda1       4096   2101247   2097152     1G EFI System
# /dev/sda2    2101248 416264108 414162861 197.5G Linux filesystem
# /dev/sda3  416264109 488397101  72132993  34.4G Linux swap

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
                        size = "500M";

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