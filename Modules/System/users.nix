{ config, pkgs, username, ... }:

{
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" ];
        shell = pkgs.zsh;
        initialPassword = username;
    };
}