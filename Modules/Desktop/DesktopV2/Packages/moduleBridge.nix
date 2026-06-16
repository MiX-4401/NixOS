{ lib, ... }:

# Everything defined by home manager lives in its own home manager scope (defined by line: home-manager.users.${username}.imports)
# This means my modular settings are held within a scope NixOS system configuraiton.nix cannot access
# This file creates a bridge between home-manager to NixOS system by using an alias

{
    imports = [
        (lib.mkAliasOptionModule
            [ "desktopDefaultApps" ]
            [ "home-manager" "users" username "desktopDefaultApps" ]
        )

        (lib.mkAliasOptionModule
            [ "desktopGit" ]
            [ "home-manager" "users" username "desktopGit" ]
        )

        (lib.mkAliasOptionModule
            [ "desktopHyprland" ]
            [ "home-manager" "users" username "desktopHyprland" ]
        )

        (lib.mkAliasOptionModule
            [ "dekstopHyprpaper" ]
            [ "home-manager" "users" username "dekstopHyprpaper" ]
        )
    ];
}