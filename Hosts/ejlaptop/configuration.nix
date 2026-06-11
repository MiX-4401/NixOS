{ pkgs, ... }:

{
  imports = [
    # Host unique
    ./hardware-configuration.nix

    # System immutable
    ../../Modules/System/bootstrap.nix
    ../../Modules/LPDesktop/default.nix
    
    # System mutable
    ../../Modules/System/Base/moduleBundle.nix
    ../../Modules/System/Security/moduleBundle.nix
  ];

  # Base settings
  BaseSetAllowUnfreeSoftware.enable = true;
  BaseSetHostname.hostname = "ejlaptop";
  BaseSetOSVersion.version = "24.05";
  BaseSetGarbageCollection.enable = true;

  # Security settings
  SecurityHardenFirewall.enable = true;
  SecurityHardenSSH.enable = false;
  SecurityHardenRoot.enable = true;
  SecurityHardenSudo.enable = true;

  # Host specific global packages
  environment.systemPackages = with pkgs; [
    microcode-intel
    sof-firmware
  ];
}
