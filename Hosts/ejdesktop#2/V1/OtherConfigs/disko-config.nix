{ disko, ... }:

{
    disko.devices.disk.primary = {
        type = "disk";
        device = "/dev/disk/by-id/";    # need to fill out    
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