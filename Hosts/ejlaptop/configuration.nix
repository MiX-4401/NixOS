{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../Modules/LPDesktop/default.nix
    ../../Modules/System/base.nix
    ../../Modules/System/users.nix
    ../../Modules/System/boot.nix
    ../../Modules/System/network.nix
    ../../Modules/System/packages.nix
    ../../Modules/System/services.nix
  ];

  networking.hostName = "ejlaptop";

  # Host specific configs
  services.sshd.enable = false;
  networking.firewall.enable = true;

  # Host specific global packages
  environment.systemPackages = with pkgs; [
    microcode-intel
    sof-firmware
  ];
}
