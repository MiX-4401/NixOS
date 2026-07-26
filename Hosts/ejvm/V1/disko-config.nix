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
            main = {
                type = "disk";
                device = "/dev/vda";
                content = {
                    type = "gpt";
                    partitions = {
                        ESP = {
                            size = "1G";
                            type = "EF00";
                            content = {
                                type = "filesystem";
                                format = "vfat";
                                mountpoint = "/boot";
                                mountOptions = [ "umask=0077" ];
                            };
                        };
                        luks = {
                            size = "100%";
                            content = {
                                type = "luks";
                                name = "crypted";
                                settings.allowDiscards = true;
                                passwordFile = "/tmp/secret.key";
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
        };
    };
}