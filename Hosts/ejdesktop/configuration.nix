{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ./virtualisation.nix
    ../../Modules/PCDesktop/default.nix
    ../../Modules/System/base.nix
    ../../Modules/System/users.nix
    ../../Modules/System/boot.nix
    ../../Modules/System/network.nix
    ../../Modules/System/packages.nix
    ../../Modules/System/services.nix
  ];

  networking.hostName = "ejdesktop";

  # Host specific configs
  services.sshd.enable = true;
  networking.firewall.enable = false;

  # Host specific global packages
  environment.systemPackages = with pkgs; [
    microcode-amd
    rocmPackages.rocm-smi
  ];
}