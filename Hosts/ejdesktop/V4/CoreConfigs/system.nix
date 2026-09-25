{ pkgs, config, ... }:

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
    config.core.system.security.hardenNetwork.enable = true;
    config.core.system.security.hardenUSB.enable = true;
    config.core.system.security.hardenUSB.rules = ''
        allow id 1d6b:0002 serial "0000:10:00.0" name "xHCI Host Controller" hash "wvrAhzCU9e70sT6fMM0V67MGfVyJgKNsoZg+d7A5Lgs=" parent-hash "2MeNPNzWUEfDeDKv2My66on8yoF+5C7VeoNPqxm0LgY=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:10:00.0" name "xHCI Host Controller" hash "FLq1DxM+z5wq8cH/tC62JPgL7ZabunbpFLNY7aZyWuI=" parent-hash "2MeNPNzWUEfDeDKv2My66on8yoF+5C7VeoNPqxm0LgY=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0002 serial "0000:12:00.3" name "xHCI Host Controller" hash "sf+X7tzJJKe2Scu1pGI1iQyd8Ao9SOPS7u2l50xDBwE=" parent-hash "Hx4HuzYCuwELabHX/4FIAnHl8itQz65sn4FiLaxTURQ=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:12:00.3" name "xHCI Host Controller" hash "WXKVrosty/SSeCPovj2MUJWvKZxeQIVhr/HrFPm89zc=" parent-hash "Hx4HuzYCuwELabHX/4FIAnHl8itQz65sn4FiLaxTURQ=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0002 serial "0000:12:00.4" name "xHCI Host Controller" hash "LDpPc2MKb89m3042f0aN9Kw2b/EEZXBt+olHt2mjttU=" parent-hash "/19RpNs6DovXKMU4cKOYSInsb0ef4JGzQGuSMHAED98=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0003 serial "0000:12:00.4" name "xHCI Host Controller" hash "pb1GsumLgXx6uCpiJcvrQRJGUX4lek6K+b5kCoqi1+A=" parent-hash "/19RpNs6DovXKMU4cKOYSInsb0ef4JGzQGuSMHAED98=" with-interface 09:00:00 with-connect-type ""
        allow id 1d6b:0002 serial "0000:13:00.0" name "xHCI Host Controller" hash "LkSVCKUK8lHT19PTHzleQzgA7+hrJbuneikfbrwZl/I=" parent-hash "le4BqnNne09VNrBVV9UN3ikcYxamVRfQrw9/rKEZaQI=" with-interface 09:00:00 with-connect-type ""
        allow id 174c:2074 serial "" name "ASM107x" hash "KjQfwiBztB653vlSzixD+8+ZDLVjfb2zJGoFc1XKUaU=" parent-hash "wvrAhzCU9e70sT6fMM0V67MGfVyJgKNsoZg+d7A5Lgs=" via-port "1-5" with-interface { 09:00:01 09:00:02 } with-connect-type "hotplug"
        allow id 0db0:422d serial "" name "USB Audio" hash "kL7WFVC+wRu2UhoA7qb7Ga7AhIMyAuHfB4xoYj5eFDA=" parent-hash "wvrAhzCU9e70sT6fMM0V67MGfVyJgKNsoZg+d7A5Lgs=" via-port "1-6" with-interface { 01:01:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 01:02:20 03:00:00 } with-connect-type "not used"
        allow id 0e8d:0616 serial "000000000" name "Wireless_Device" hash "eM73IFKY9T4ydP+CKuo6KEp/Fhrl72VFzccohhOSiRg=" parent-hash "wvrAhzCU9e70sT6fMM0V67MGfVyJgKNsoZg+d7A5Lgs=" with-interface { e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 } with-connect-type "not used"
        allow id 174c:3074 serial "" name "ASM107x" hash "U9v9rNSjHH3wfU8Xni2n2K4zcUcPPLLsZ3MLAuvSc6A=" parent-hash "FLq1DxM+z5wq8cH/tC62JPgL7ZabunbpFLNY7aZyWuI=" via-port "2-5" with-interface 09:00:00 with-connect-type "hotplug"
        allow id 1462:7d75 serial "7D7523011907" name "MYSTIC LIGHT " hash "dwixN3VQG79BJwDtTVrmSaHS+MEaY3foTxFQ8A35qdo=" parent-hash "wvrAhzCU9e70sT6fMM0V67MGfVyJgKNsoZg+d7A5Lgs=" with-interface 03:00:00 with-connect-type "not used"
        allow id 05e3:0608 serial "" name "USB2.0 Hub" hash "5uYwceHbvuBGAzUuLBS+ZQi9HzXT0tA6gPM3aE6l+PU=" parent-hash "wvrAhzCU9e70sT6fMM0V67MGfVyJgKNsoZg+d7A5Lgs=" via-port "1-12" with-interface 09:00:00 with-connect-type "hotplug"
        allow id 046d:c33f serial "1790324E3836" name "G815 RGB MECHANICAL GAMING KEYBOARD" hash "If8l/LLBn1sUt6qJij3dIL6dv5oeKv+ZryPQtZbDtjA=" parent-hash "KjQfwiBztB653vlSzixD+8+ZDLVjfb2zJGoFc1XKUaU=" with-interface { 03:01:01 03:00:00 } with-connect-type "unknown"
        allow id 1050:0407 serial "" name "YubiKey OTP+FIDO+CCID" hash "2msOvGX5iCToX2LqCqPIO9H6KxlnnkuQgfKCOZkGzNg=" parent-hash "KjQfwiBztB653vlSzixD+8+ZDLVjfb2zJGoFc1XKUaU=" via-port "1-5.2" with-interface { 03:01:01 03:00:00 0b:00:00 } with-connect-type "unknown"
        allow id 046d:c07e serial "498B587A3235" name "Gaming Mouse G402" hash "ln34xeondrI8S0qN28OKu5qIXN7t98Q2oKPvV8+oFXQ=" parent-hash "KjQfwiBztB653vlSzixD+8+ZDLVjfb2zJGoFc1XKUaU=" with-interface { 03:01:02 03:00:00 } with-connect-type "unknown"
        allow id 03f0:03c0 serial "0123456789" name "HyperX Cloud Jet" hash "ffvGlNc4UFQTYOznlcheHYwyFxaHnGFSlUQomtLGax4=" parent-hash "KjQfwiBztB653vlSzixD+8+ZDLVjfb2zJGoFc1XKUaU=" with-interface { 01:01:00 01:02:00 01:02:00 01:02:00 01:02:00 03:00:00 } with-connect-type "unknown"
    '';
    config.core.system.security.hardenAuditing.enable = true;
    config.core.system.security.hardenSandboxing.enable = true;
    
    # core.system.nix options
    config.core.system.nix.allowUnfreeSoftware = true;
    
    # core.system.misc options
    config.core.system.misc.wallpaper.filename = "spaceking10.png";
    config.core.system.misc.gaming.enable = true;

    # core.system.nixos options
    config.core.system.nixos.printing.enable = true;
    config.core.system.nixos.printing.allowAutoDiscovery = false;
    config.core.system.nixos.printing.drivers = [];
    config.core.system.nixos.printing.printers = [
        {   # MFC-L3770CDW
            name = "Brother-Printer";
            location = "Home";
            deviceUri = "ipp://192.168.5.126/ipp/print";
            model = "everywhere";
            ppdOptions = {
                PageSize = "A4";
            };
        }
    ];

    config.core.system.nixos.garbageCollection.enable = true;
    config.core.system.nixos.garbageCollection.period = "daily";
    config.core.system.nixos.osVersion = "26.05";
    config.core.system.nixos.hostname = "ejdesktop";
}
