{ pkgs, ... }:

{
    virtualisation.libvirtd = {
        enable = true;
        qemu = {
            package = pkgs.qemu_kvm;
            runAsRoot = true;
            swtpm.enable = true;
        };
    };

    program.virt-manager.enable = true;

    # boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];
    boot.kernelModules = [ "amd_iommu=on" "iommu=pt" "video=efifb:off" ];
}