{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./virtualisation.nix
    ../../Modules/PCDesktop/default.nix
    ../../Modules/System/base.nix
    ../../Modules/System/hardening.nix
    ../../Modules/System/users.nix
    ../../Modules/System/boot.nix
    ../../Modules/System/network.nix
    ../../Modules/System/packages.nix
    ../../Modules/System/services.nix
  ];

  networking.hostName = "ejdesktop";
  # services.openssh.enable = true;
  # networking.firewall.enable = false;

  # Host specific global packages
  environment.systemPackages = with pkgs; [
    microcode-amd
    rocmPackages.rocm-smi
  ];
}