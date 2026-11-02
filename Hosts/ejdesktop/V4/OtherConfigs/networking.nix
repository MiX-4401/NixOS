{ ... }:

{
    # networking.interfaces.enp14s0 = {
    #     useDHCP = false;

    #     # Set ip statically
    #     ipv4.addresses = [{ address = "192.168.5.109"; prefixLength = 24;}];
    # };

    # Prevent DNS managed by DHCP
    networking.nameservers = [ "1.1.1.1" ];
    networking.networkmanager.insertNameservers = [ "1.1.1.1" ];

}