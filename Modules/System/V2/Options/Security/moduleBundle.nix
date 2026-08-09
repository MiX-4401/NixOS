{ ... }:

{
    imports = [
        ./hardenFirewall.nix
        ./hardenOpenSSH.nix
        ./hardenRoot.nix
        ./hardenSudo.nix
        # ./hardenSandboxing.nix
        ./hardenNetwork.nix
        ./hardenServices.nix
        ./hardenPam.nix
    ];
}