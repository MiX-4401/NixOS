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
  BaseSetHostname.hostname = "ejdesktop";
  BaseSetOSVersion.version = "24.05";
  BaseSetGarbageCollection.enable = true;
  BaseSetDownloadBufferSize.size = 134217728;

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