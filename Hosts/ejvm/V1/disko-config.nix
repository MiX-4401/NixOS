# USAGE in your configuration.nix.
# Update devices to match your hardware.
# {
#  imports = [ ./disko-config.nix ];
#  disko.devices.disk.main.device = "/dev/sda";
# }

{
    
    # Disks
    disko.devices.disk.main = {
        type = "disk";
        device = "/dev/vda";
        content.type = "gpt";
        
        # Boot partition
        content.partitions.ESP = {
            name = "ESP";
            size = "500M";
            type = "EF00";
            content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
            };
        };

        # LUKs partition (root)
        content.partitions.luks = {
            name = "root";
            size = "100%";
            content = {
                type = "luks";
                name = "cryptroot";
                content = {
                    type = "lvm_pv";
                    vg = "myPool";
                };
            };
        };
    };

    # LVMs
    disko.devices.lvm_vg.myPool = {
        type = "lvm_vg";
        
        # LVM logical volume (swap)
        lvs.swap.size = "8G";
        lvs.swap.content = {
            type = "swap";
            discardPolicy = "both";
            resumeDevice = true;
        };

        # LVM logical volume (root)
        lvs.root.size = "100%FREE";
        lvs.root.content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
            mountOptions = [ "defaults" ];
        };
    };
}