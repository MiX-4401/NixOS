# USAGE in your configuration.nix.
# Update devices to match your hardware.
# {
#  imports = [ ./disko-config.nix ];
#  disko.devices.disk.main.device = "/dev/sda";
# }

{ disko, ... }:

{
    imports = [ disko.nixosModules.disko ];

    disko.devices = {
        disk = {
            type = "disk";
            device = "/dev/vda";
            content = {
                type = "table";
                format = "gpt";
                partitions = [

                    # Boot partition
                    {
                        name = "ESP";
                        size = "500M";
                        type = "EF00";
                        content = {
                            type = "filesystem";
                            format = "vfat";
                            mountpoint = "/boot";
                            mountOptions = [ "umask=0077" ];
                        };
                    }

                    # LUKs partition (root)
                    {
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
                    }
                ];
            };
        };

        lvm_vg.myPool = {
            type = "lvm_vg";
            lvs = [

                # SWAP

                {
                    name = "swap";
                    size = "8G";
                    content = {
                        type = "swap";
                        discardPolicy = "both";
                        resumeDevice = true;
                    };
                }

                # Root
                {
                    name = "root";
                    size = "100%FREE";
                    content = {
                        type = "filesystem";
                        format = "ext4";
                        mountpoint = "/";
                        mountOptions = [ "defaults" ];
                    };
                }

            ];
        };
    };
}