{ lib, ... }:

# Everything defined by home manager lives in its own home manager scope (defined by line: home-manager.users.${username}.imports)
# This means my modular settings are held within a scope NixOS system configuraiton.nix cannot access
# This file creates a bridge between home-manager to NixOS system by using an alias

{
    imports = [
        (lib.mkAliasOptionModule
            [ "desktopPackageBundleDesktopUtilities" ]
            [ "home-manager" "users" username "desktopPackageBundleDesktopUtilities" ]
        )

        (lib.mkAliasOptionModule
            [ "desktopPackageBundleExtra" ]
            [ "home-manager" "users" username "desktopPackageBundleExtra" ]
        )

        (lib.mkAliasOptionModule
            [ "desktopPackageBundleGaming" ]
            [ "home-manager" "users" username "desktopPackageBundleGaming" ]
        )

        (lib.mkAliasOptionModule
            [ "desktopPackageBundleOfficeUtilities" ]
            [ "home-manager" "users" username "desktopPackageBundleOfficeUtilities" ]
        )

        (lib.mkAliasOptionModule
            [ "desktopPackageBundleSocials" ]
            [ "home-manager" "users" username "desktopPackageBundleSocials" ]
        )
    ];
}