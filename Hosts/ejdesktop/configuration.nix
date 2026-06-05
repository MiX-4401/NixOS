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
  ];

  networking.hostName = "ejdesktop";
  services.openssh.enable

  # Host specific global packages
  environment.systemPackages = with pkgs; [
    microcode-amd
    rocmPackages.rocm-smi
  ];
}