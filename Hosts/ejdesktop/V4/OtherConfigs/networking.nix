{ ... }:

{
    networking.interfaces.enp14s0 = {
        useDHCP = false;

        # Set ip statically
        ipv4.addresses = [{ address = "192.168.5.109"; prefixLength = 24;}];
    };
}