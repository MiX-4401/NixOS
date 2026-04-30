{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../Modules/Common/users.nix
    ../../Modules/Common/boot.nix
    ../../Modules/Common/base.nix
    ../../Modules/Common/network.nix
  ];

  # Host specific configs
  
  services.sshd.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
