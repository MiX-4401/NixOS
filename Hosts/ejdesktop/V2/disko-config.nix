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

                    root = {
                        size = "197.5G";

                        content = {
                            type = "filesystem";
                            format = "ext4";
                            mountpoint = "/";
                        };
                    };

                    swap = {
                        size = "34.4G";

                        content = {
                            type = "swap";
                            resumeDevice = true;
                        };
                    };
                };
            };
        };

        # Games (GA)
        # SDB1 (/mnt/GA)  
        disk.sdb = {
            type = "disk";
            device = "/dev/disk/by-id/ata-ST6000VX0003-1ZH110_ZAD28KQ2";
            content = {
                type = "gpt";
                partitions = {
                    GA = {
                        size = "100%";
                        content = {
                            type = "filesystem";
                            format = "ext4";
                            mountpoint = "/media/GA";
                        };
                    };
                };                
            };
        };

        # Software (SO)
        # SDC1 (/mnt/SO)  
        disk.sdc = {
            type = "disk";
            device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_500GB_S4BENG0KC55257T";
            content = {
                type = "gpt";
                partitions = {
                    SO = {
                        size = "100%";
                        content = {
                            type = "filesystem";
                            format = "ext4";
                            mountpoint = "/media/SO";
                        };
                    };
                };                
            };
        };

        # Backups (BU)
        # SDD1 (/mnt/BU)   
        disk.sdd = {
            type = "disk";
            device = "/dev/disk/by-id/ata-HGST_HTS541010A9E680_JA1080SB0BV48P";
            content = {
                type = "gpt";
                partitions = {
                    BU = {
                        size = "100%";
                        content = {
                            type = "filesystem";
                            format = "ext4";
                            mountpoint = "/media/BU";
                        };
                    };
                };                
            };
        };
    };
}

# Current FSTAB
# /dev/disk/by-uuid/e3b9a04a-b4f1-422b-a505-e67313d1cbb1 / ext4 x-initrd.mount 0 1
# /dev/disk/by-uuid/C338-5727 /boot vfat fmask=0077,dmask=0077 0 2
# /dev/disk/by-uuid/b6abf207-ddc0-46ee-8e35-fbb670f0db5a /mnt/BU ext4 defaults 0 2
# /dev/disk/by-uuid/8c7f09a1-968c-4a11-965d-67bb9abda72d /mnt/GA ext4 defaults 0 2
# /dev/disk/by-uuid/cf0fb9dc-8c18-4064-90b3-c95ff324667a /mnt/SO ext4 defaults 0 2


# # Swap devices.
# /dev/disk/by-uuid/5460bcfb-4e60-4d1e-a2a4-39aca6e38f56 none swap defaults

# Device         Start       End   Sectors   Size Type
# /dev/sda1       4096   2101247   2097152     1G EFI System
# /dev/sda2    2101248 416264108 414162861 197.5G Linux filesystem
# /dev/sda3  416264109 488397101  72132993  34.4G Linux swap