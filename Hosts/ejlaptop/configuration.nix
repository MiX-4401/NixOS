{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../Modules/Common/base.nix
    ../../Modules/Common/users.nix
    ../../Modules/Common/boot.nix
    ../../Modules/Common/network.nix
    ../../Modules/Common/packages.nix
  ];

  # Host specific configs
  services.sshd.enable = true;
}
