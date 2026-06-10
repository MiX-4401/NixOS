{ pkgs, config, ... }:

{
  imports = [
    # Host unique
    ./hardware-configuration.nix
    ./virtualisation.nix

    # System immutable
    ../../Modules/System/bootstrap.nix
    ../../Modules/PCDesktop/default.nix
    
    # System mutable
    ../../Modules/System/Base/moduleBundle.nix
    ../../Modules/System/Security/moduleBundle.nix
  ];

  # Base settings
  BaseSetAllowUnfreeSoftware.enable = true;
  # BaseSetHostname.hostname = "ejdesktop";
  BaseSetHostname.hostname = "mydesktop";
  BaseSetOSVersion.version = "24.05";
  BaseSetGarbageCollection.enable = true;

  # Security settings
  SecurityHardenFirewall.enable = true;
  SecurityHardenSSH.enable = false;
  SecurityHardenRoot.enable = true;
  SecurityHardenSudo.enable = true;

  # Host specific global packages
  environment.systemPackages = with pkgs; [
    microcode-amd
    rocmPackages.rocm-smi
  ];
}