{ config, ... }:

{
    # core.system.security options
    config.core.system.security.hardenSudo.enable = true;
    config.core.system.security.hardenOpenSSH.enable = false;
    config.core.system.security.hardenOpenSSH.harden = true;
    config.core.system.security.hardenRoot.enable = true;
    config.core.system.security.hardenFirewall.enable = true;
    config.core.system.security.hardenServices.enable = false;
    config.core.system.security.hardenServices.services = [ "cups" ]; # "nscd" "sshd" 
    config.core.system.security.hardenPam.enable = true;
    config.core.system.security.hardenNetwork.enable = false;
    config.core.system.security.hardenUSB.enable = true;
    config.core.system.security.hardenUSB.rules = ''
        allow id 1d6b:0002 serial "0000:03:00.0" name "xHCI Host Controller" hash "Lw/Cdah32MiEGYi1D+rX5Vcs8544WKd6bqSOuVKqKn4=" parent-hash "w3c++Hva/cvMNTcx3y72UlxkR0WUPCWne2mlaosYanw=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:03:00.0" name "xHCI Host Controller" hash "c1GzfYehHdtWBOENk8lHR7dYx3uNOWqGa97jUfk5r0E=" parent-hash "w3c++Hva/cvMNTcx3y72UlxkR0WUPCWne2mlaosYanw=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0002 serial "0000:2d:00.3" name "xHCI Host Controller" hash "w0s+/0l185H3y20XSMXWN6ut4SGmlt7G3DiDnvIKJAo=" parent-hash "ZlOCckzAQX5oe+eVXKBLlwzfEZrQQatYPDOVaXWS1fk=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:2d:00.3" name "xHCI Host Controller" hash "/wEAALcWgNDZSgOyp1ns2y+xeLpaF5P61j/IvuOpIUo=" parent-hash "ZlOCckzAQX5oe+eVXKBLlwzfEZrQQatYPDOVaXWS1fk=" with-interface 09:00:00 with-connect-type ""
        allow id 152d:2590 serial "00A12345AFD0" name "Generic USB Device" hash "HUmsQa8J+vytZJQMJtfVO4J7jHFE4fzFOBNY4WkmYsk=" parent-hash "Lw/Cdah32MiEGYi1D+rX5Vcs8544WKd6bqSOuVKqKn4=" with-interface { 08:06:50 08:06:62 } with-connect-type "hotplug"
        allow id 1050:0407 serial "" name "YubiKey OTP+FIDO+CCID" hash "2msOvGX5iCToX2LqCqPIO9H6KxlnnkuQgfKCOZkGzNg=" parent-hash "Lw/Cdah32MiEGYi1D+rX5Vcs8544WKd6bqSOuVKqKn4=" via-port "1-7" with-interface { 03:01:01 03:00:00 0b:00:00 } with-connect-type "hotplug"
        allow id 10f5:216f serial "" name "Stealth 600" hash "niJ9EallzTaj2y7AtSjKZG4cncSiaqOXZf5wBkwZl7c=" parent-hash "w0s+/0l185H3y20XSMXWN6ut4SGmlt7G3DiDnvIKJAo=" via-port "3-1" with-interface 03:00:00 with-connect-type "unknown"
        allow id 046d:c07e serial "498B587A3235" name "Gaming Mouse G402" hash "ln34xeondrI8S0qN28OKu5qIXN7t98Q2oKPvV8+oFXQ=" parent-hash "w0s+/0l185H3y20XSMXWN6ut4SGmlt7G3DiDnvIKJAo=" with-interface { 03:01:02 03:00:00 } with-connect-type "unknown"
        allow id 046d:c33f serial "1790324E3836" name "G815 RGB MECHANICAL GAMING KEYBOARD" hash "If8l/LLBn1sUt6qJij3dIL6dv5oeKv+ZryPQtZbDtjA=" parent-hash "Lw/Cdah32MiEGYi1D+rX5Vcs8544WKd6bqSOuVKqKn4=" with-interface { 03:01:01 03:00:00 } with-connect-type "hotplug"
    '';
    config.core.system.security.hardenAuditing.enable = true;
    config.core.system.security.hardenSandboxing.enable = true;
    
    # core.system.nix options
    config.core.system.nix.allowUnfreeSoftware = true;
    
    # core.system.misc options
    config.core.system.misc.wallpaper.filename = "rainworld03.jpg";
    config.core.system.misc.gaming.enable = true;

    # core.system.nixos options
    config.core.system.nixos.printing.enable = true;
    config.core.system.nixos.garbageCollection.enable = true;
    config.core.system.nixos.garbageCollection.period = "daily";
    config.core.system.nixos.osVersion = "26.05";
    config.core.system.nixos.hostname = "ejdesktop";
}

