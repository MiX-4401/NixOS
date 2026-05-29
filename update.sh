rm /etc/nixos/NixOS -R
# cp /home/ejradford/Documents/NixOS /etc/nixos/NixOS -R
git clone https://github.com/MiX-4401/NixOS.git /etc/nixos/NixOS
nixos-rebuild switch --flake /etc/nixos/NixOS