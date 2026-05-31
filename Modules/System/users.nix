{ config, pkgs, username, ... }:

{
    # Disable root account
    users.users.root.hashedPassword = "!";

    # Users
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" ];
        shell = pkgs.zsh;
        initialPassword = username;
    };
}