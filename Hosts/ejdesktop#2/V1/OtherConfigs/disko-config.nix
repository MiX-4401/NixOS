{ disko, ... }:

{
    disko.devices.disk.primary = {
        type = "disk";
        device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_M.2_250GB_S413NB0K515812B";    
        content = {
            type = "gpt";

            # Boot partition (/boot)
            partitions.ESP.size = "500M";
            partitions.ESP.type = "EF00";
            partitions.ESP.content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
            };

            # Root partition (/)
            partitions.root.size = "100%";
            partitions.root.content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = [ "defaults" ];
            };
        };
    };
}