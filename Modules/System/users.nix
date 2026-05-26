{ config, pkgs, username, ... }:

{
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" ];
        shell = pkgs.zsh;
        hashedPassword = "$6$dpR5KS22c3tIhRZ7$FhWMuP6mhb4L6BlBkt1BBBb9tMcftiX041KrU/sjazfQYk38YwziumJ1uqJOt/udssACCPvasDmQK2B8oWOwx1";
    };
}