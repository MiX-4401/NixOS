{ config, ... }:

{
    # core.system.security options
    core.system.security.hardenSudo.enable = true;
    core.system.security.hardenOpenSSH.enable = true;
    core.system.security.hardenOpenSSH.harden = true;
    core.system.security.hardenRoot.enable = true;
    core.system.security.hardenFirewall.enable = true;
    core.system.security.hardenServices.enable = true;
    core.system.security.hardenServices.base = [ "sshd", "" ];
    core.system.security.hardenServices.strict = [ ];
    
    # core.system.nix options
    core.system.nix.allowUnfreeSoftware = true;
    
    # core.system.misc options
    core.system.misc.wallpaper.filename = "rainworld12.png";
    core.system.misc.gaming.enable = true;

    # core.system.nixos options
    core.system.nixos.printing.enable = true;
    core.system.nixos.garbageCollection.enable = true;
    core.system.nixos.garbageCollection.period = "daily";
    core.system.nixos.osVersion = "26.05";
    core.system.nixos.hostname = "ejdesktop";
}

