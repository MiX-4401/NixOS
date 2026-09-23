{ disko, ... }:

{
    disko.devices.disk.primary = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-SAMSUNG_MZVL2512HCJQ-00BH1_S63ZNE0R300787";    
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

            # Swap partition
            partitions.swap.size = "20GB";
            partitions.content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
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