# disko-config.nix

# Paritioning is setup as follows 
# RAID0 (disk one + disk two) -> LUKs -> LVM -> swap () and ext4 (/)

{
    # Physical disk one configs
    disko.devices.disk.primary = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_250GB_S465NX1KA60626K";
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

    # Physical disk two configs
    disko.devices.disk.secondary = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_250GB_S4EUNF0M952220Y";
        content = {
            type = "gpt";
        
            # Boot partition (backup)
            partitions.ESP.size = "500M";
            partitions.ESP.type = "EF00";
            partitions.ESP.content = {
                type = "filesystem";
                format = "vfat";
                # No mounting
            };

            # RAID0 partition
            partitions.mdadm.size = "100%";
            partitions.mdadm.content = {
                type = "mdraid";
                name = "raid0";
            };
        };
    };

    # Mdadm RAID0 configs - Combine storage remaining pools of both primary and secondary disks in raid0 
    disko.devices.mdadm.raid0 = {
        type = "mdadm";
        level = 0;
        content = {
            type = "gpt";

            # Build LUKs partition (container) for encryption
            partitions.luks.size = "100%";
            partitions.luks.content = {
                type = "luks";
                name = "crypted";
                settings.allowDiscards = true;
                crypttabExtraOpts = [
                    "fido2-device=auto"
                ];
                content = {
                    type = "lvm_pv";
                    vg = "myPool";
                };
            };
        };
    };

    # LVM configs - Lives inside of LUKs container for easy volume management via logical volumes (lvs)
    disko.devices.lvm_vg.myPool = {
        type = "lvm_vg";

        # Swap volume (with hibernation) - no need for encryption as the lv lives inside of a LUKs container 
        lvs.swap.size = "40GB"; # 1.25 times 32GB to account for uncompressed memory
        lvs.swap.content = {
            type = "swap";
            discardPolicy = "both";
            resumeDevice = true;
        };

        # Root volume - all data is encrypted due to the LUKs container
        lvs.root.size = "100%FREE";
        lvs.root.content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
            mountOptions = [ "defaults" ];
        };
    };
}