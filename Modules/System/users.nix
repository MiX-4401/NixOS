{ config, pkgs, username, inputs, ... }:

{
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
        hashedPassword = "$6$dpR5KS22c3tIhRZ7$FhWMuP6mhb4L6BlBkt1BBBb9tMcftiX041KrU/sjazfQYk38YwziumJ1uqJOt/udssACCPvasDmQK2B8oWOwx1";
    };
}