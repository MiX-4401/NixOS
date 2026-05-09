{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./home-manager.nix
    ../../Modules/System/base.nix
    ../../Modules/System/users.nix
    ../../Modules/System/boot.nix
    ../../Modules/System/network.nix
    ../../Modules/System/packages.nix
  ];

  # Host specific configs
  services.sshd.enable = true;
}
