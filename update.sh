rm -R /etc/nixos/NixOS
cp -R /home/ejradford/NixOS /etc/nixos
nixos-rebuild test --flake /etc/nixos/NixOS