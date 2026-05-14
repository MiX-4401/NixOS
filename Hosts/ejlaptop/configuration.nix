{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./home-manager.nix
    ./stylix
    ../../Modules/System/base.nix
    ../../Modules/System/users.nix
    ../../Modules/System/boot.nix
    ../../Modules/System/network.nix
    ../../Modules/System/packages.nix
  ];

  # Host specific configs
  services.sshd.enable = true;
  networking.firewall.enable = false;
}
