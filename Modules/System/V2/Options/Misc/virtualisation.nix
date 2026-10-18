{ lib, config, pkgs, username, ... }:

{

    options.core.system.misc.virtualisation = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable virutalisation technologies";
        };

        enableGPUPassthroughSupport = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enables GPU passthrough support";
        };
    };

    config = lib.mkIf config.core.system.misc.virtualisation.enable {
        
        # Ensure correct user permissions are set
        users.groups.libvirtd.members = [ username ];

        # Enable virtmanager 
        programs.virt-manager.enable = true;

        # Enable virtualisation technology
        virtualisation.libvirtd = {
            enable = true;
            qemu = {
                runAsRoot = true;
                swtpm.enable = true;
            };
        };

        virtualisation.spiceUSBRedirection = {     # USB passthrough
            enable = true;
        };

        # Set custom boot parametres for additional support
        # Enables GPU passthrough support for AMD cards
        boot = lib.mkIf config.core.system.misc.virtualisation.enableGPUPassthroughSupport {                        
            kernelParams = [
                "amd_iommu=on"
                "iommu=pt"
            ];


            kernelModules = [
                "kvm-amd"
                "vfio"
                "vfio_pci"
                "vfio_iommu_type1"
            ];
        };

        environment.systemPackages = with pkgs; [
            dmidecode
            OVMF
            # dnsmasq
            # iptables
        ];
    };
}