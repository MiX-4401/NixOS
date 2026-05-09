{ pkgs, ... }:

{
    # Networking
    networking.networkmanager = {
        enable = true;
    };
}