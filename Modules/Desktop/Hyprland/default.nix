{ ... };

{
    wayland.windowManager.hyprland.enable = true;

    imports = [
        # ./startup.nix
        # ./monitors.nix
        # ./windows.nix
        # ./decorations.nix
        # ./layout.nix
        # ./keyboard.nix
        # ./input.nix
        # ./animations.nix
    ];
}