{ pkgs, username, ... }:

{
    programs.virt-manager.enable = true;
    
    users.groups.libvirtd.members = [ username ];

    virtualisation.libvirtd = {
        enable = true;
    };

    virtualisation.spiceUSBRedirection = {
        enable = true;
    };

    # boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];
    # boot.kernelModules = [ "amd_iommu=on" "iommu=pt" "video=efifb:off" ];
    boot.kernelModules = [ "amd_iommu=on" ];
}