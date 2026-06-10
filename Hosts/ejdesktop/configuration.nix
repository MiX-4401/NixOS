{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./virtualisation.nix
    ../../Modules/PCDesktop/default.nix
    ../../Modules/System/base.nix
    ../../Modules/System/users.nix
    ../../Modules/System/boot.nix
    ../../Modules/System/network.nix
    ../../Modules/System/packages.nix
    ../../Modules/System/services.nix

    ../../Modules/System/Security/moduleBundle.nix
  ];

  networking.hostName = "ejdesktop";

  SecurityHardenFirewall = true;
  SecurityHardenSSH = true;
  SecurityhardenRoot = true;
  SecurityHardenSudo = true;

  # Host specific global packages
  environment.systemPackages = with pkgs; [
    microcode-amd
    rocmPackages.rocm-smi
  ];
}