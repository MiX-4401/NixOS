{ config, pkgs, username, ... }:

{
    # Users
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" ];
        shell = pkgs.zsh;
        initialPassword = username;
    };
}