{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../Modules/Common/boot.nix
    ../../Modules/Common/base.nix
    ../../Modules/Common/network.nix
  ];

  # Host specific configs
  
  services.sshd.enable = true;

  users.users.nixuser = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    password = "nixuser";
  };

  programs.zsh = {
    enable = true;
    autosuggestions.async = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
        c = "clear";
    };     
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
