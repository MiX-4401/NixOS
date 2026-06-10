{ ... }:

{
    imports = [
        ./hardenFirewall.nix
        ./hardenOpenSSH.nix
        ./hardenRoot.nix
        ./hardenSudo.nix
        ./enablessh.nix
    ];
}