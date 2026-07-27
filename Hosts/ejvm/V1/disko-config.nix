# RAID --> LUKS --> LVM --> ext4

{
    # Disk one
    disko.devices.disk.primary = {
        type = "disk";
        device = "/dev/vda";
        content = {
            type = "gpt";
        
            # Boot partition 
            partitions.ESP.size = "500M";
            partitions.ESP.type = "EF00";
            partitions.ESP.content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
            };

            # RAID0 partition
            partitions.mdadm.size = "100%";
            partitions.mdadm.content = {
                type = "mdraid";
                name = "raid0";
            };
        };
    };

    # Disk two
    disko.devices.disk.secondary = {
        type = "disk";
        device = "/dev/vdb";
        content = {
            type = "gpt";
        
            # Boot partition 
            partitions.ESP.size = "500M";
            partitions.ESP.type = "EF00";
            partitions.ESP.content = {
                type = "filesystem";
                format = "vfat";
                # mountpoint = "/boot";
                # mountOptions = [ "umask=0077" ];
            };

            # RAID0 partition
            partitions.mdadm.size = "100%";
            partitions.mdadm.content = {
                type = "mdraid";
                name = "raid0";
            };
        };
    };

    # Mdadm RAID0
    disko.devices.mdadm.raid0 = {
        type = "mdadm";
        level = 0;
        content = {
            type = "gpt";

            partitions.luks.size = "100%";
            partitions.luks.content = {
                type = "luks";
                name = "cryptroot";
                content = {
                    type = "lvm_pv";
                    vg = "myPool";
                };
            };
        };
    };

    # LVM 
    disko.devices.lvm_vg.myPool = {
        type = "lvm_vg";

        lvs.swap.size = "8GB";
        lvs.swap.content = {
            type = "swap";
            discardPolicy = "both";
            resumeDevice = true;
        };

        lvs.root.size = "100%FREE";
        lvs.root.content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
            mountOptions = [ "defaults" ];
        };
    };
}