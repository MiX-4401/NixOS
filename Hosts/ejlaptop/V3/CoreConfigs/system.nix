{ config, ... }:

{
    # core.system.security options
    config.core.system.security.hardenSudo.enable = true;
    config.core.system.security.hardenOpenSSH.enable = false;
    config.core.system.security.hardenOpenSSH.harden = true;
    config.core.system.security.hardenRoot.enable = true;
    config.core.system.security.hardenFirewall.enable = true;
    # config.core.system.security.hardenServices.enable = false;
    # config.core.system.security.hardenServices.services = [ "sshd" "cups" ]; #"nscd" 
    config.core.system.security.hardenPam.enable = true;
    config.core.system.security.hardenNetwork.enable = false;
    config.core.system.security.hardenUSB.enable = false;
    config.core.system.security.hardenUSB.rules = '''';
    
    # core.system.nix options
    config.core.system.nix.allowUnfreeSoftware = true;
    
    # core.system.misc options
    config.core.system.misc.wallpaper.filename = "rainworld12.png";
    config.core.system.misc.gaming.enable = false;

    # core.system.nixos options
    config.core.system.nixos.printing.enable = true;
    config.core.system.nixos.garbageCollection.enable = true;
    config.core.system.nixos.garbageCollection.period = "daily";
    config.core.system.nixos.osVersion = "26.05";
    config.core.system.nixos.hostname = "ejlaptop";
}

