rm -R /etc/nixos/NixOS
cp -R /home/ejradford/NixOS /etc/nixos
nixos-rebuild switch --flake /etc/nixos/NixOS