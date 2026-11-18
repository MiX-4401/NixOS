{ lib, username, ... }:

# Everything defined by home manager lives in its own home manager scope (defined by line: home-manager.users.${username}.imports)
# This means my modular settings are held within a scope NixOS system configuraiton.nix cannot access
# This file creates a bridge between home-manager to NixOS system by using an alias; merging the home-manager and NixOS scopes with the alias 'desktop'
# This is likely the most confusing syntax in this entire repository

{
    imports = [
        (lib.mkAliasOptionModule
            [ "desktop" ]
            [ "home-manager" "users" username "desktop" ]
        )
    ];
}