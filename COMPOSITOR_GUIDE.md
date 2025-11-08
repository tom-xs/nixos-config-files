# Hyprland and Niri Configuration Guide

This repository now includes configuration files for both **Hyprland** and **Niri** Wayland compositors, in addition to the existing GNOME setup.

## Available Configurations

### 1. GNOME (Default)
The original desktop environment configuration.

### 2. Hyprland
A dynamic tiling Wayland compositor with beautiful animations and Nvidia support.

**Configuration files:**
- `configs/hyprland-configuration.nix` - System-level Hyprland configuration
- `home/hyprland.nix` - User-level Hyprland configuration with keybindings and appearance

### 3. Niri
A scrollable-tiling Wayland compositor with a unique workflow.

**Configuration files:**
- `configs/niri-configuration.nix` - System-level Niri configuration
- `home/niri.nix` - User-level Niri configuration in KDL format

## How to Use

### Option 1: Switch to Hyprland

1. Edit `flake.nix` and modify the modules section:

```nix
modules = [
  ./configs/configuration.nix
  ./configs/nvidia-configuration.nix
  ./configs/hyprland-configuration.nix  # Add this line
  
  ./home/home.nix
  ./home/hyprland.nix  # Add this line
];
```

2. Rebuild your system:
```bash
sudo nixos-rebuild switch --flake .#camaragibe
```

3. Log out and select "Hyprland" from your display manager

### Option 2: Switch to Niri

1. Edit `flake.nix` and modify the modules section:

```nix
modules = [
  ./configs/configuration.nix
  ./configs/nvidia-configuration.nix
  ./configs/niri-configuration.nix  # Add this line
  
  ./home/home.nix
  ./home/niri.nix  # Add this line
];
```

2. Rebuild your system:
```bash
sudo nixos-rebuild switch --flake .#camaragibe
```

3. Log out and select "Niri" from your display manager

### Option 3: Keep All Configurations Available

You can include all compositor configurations and switch between them at login:

```nix
modules = [
  ./configs/configuration.nix
  ./configs/nvidia-configuration.nix
  # Uncomment the compositor you want available:
  # ./configs/hyprland-configuration.nix
  # ./configs/niri-configuration.nix
  
  ./home/home.nix
  # Uncomment the corresponding home configuration:
  # ./home/hyprland.nix
  # ./home/niri.nix
];
```

## Hyprland Key Bindings

The default modifier key is `SUPER` (Windows key):

- `SUPER + Q` - Open terminal (Kitty)
- `SUPER + C` - Close active window
- `SUPER + M` - Exit Hyprland
- `SUPER + E` - Open file manager (Thunar)
- `SUPER + V` - Toggle floating
- `SUPER + R` - Open app launcher (Wofi)
- `SUPER + Arrow Keys` - Move focus
- `SUPER + 1-9` - Switch to workspace
- `SUPER + SHIFT + 1-9` - Move window to workspace

## Niri Key Bindings

The default modifier key is `Mod` (Windows/Super key):

- `Mod + Return` - Open terminal (Kitty)
- `Mod + D` - Open app launcher (Fuzzel)
- `Mod + Q` - Close active window
- `Mod + Shift + E` - Quit Niri
- `Mod + Arrow Keys` or `H/J/K/L` - Navigate focus
- `Mod + Shift + Arrow Keys` or `H/J/K/L` - Move windows
- `Mod + 1-9` - Switch to workspace
- `Mod + Shift + 1-9` - Move window to workspace
- `Mod + F` - Fullscreen window
- `Print` - Take screenshot

## Installed Utilities

Both configurations include:
- **Terminal**: Kitty (Hyprland & Niri), Alacritty (Niri)
- **App Launcher**: Wofi (Hyprland), Fuzzel (Niri)
- **Notifications**: Dunst (Hyprland), Mako (Niri)
- **Wallpaper**: Hyprpaper (Hyprland), Swaybg (Niri)
- **Screen Lock**: Swaylock
- **Screenshots**: Grim + Slurp
- **Clipboard**: wl-clipboard
- **Status Bar**: Waybar (Hyprland only)
- **File Manager**: Thunar

## Nvidia Compatibility

Both configurations are pre-configured for Nvidia GPUs with proper environment variables:
- `LIBVA_DRIVER_NAME=nvidia`
- `GBM_BACKEND=nvidia-drm`
- `__GLX_VENDOR_LIBRARY_NAME=nvidia`
- `WLR_NO_HARDWARE_CURSORS=1`

## Customization

### Hyprland
Edit `home/hyprland.nix` to customize:
- Keybindings in the `bind` section
- Appearance in the `decoration` section
- Animations in the `animations` section
- Gaps and borders in the `general` section

### Niri
Edit `home/niri.nix` to customize:
- Keybindings in the `binds` section
- Layout settings in the `layout` section
- Input configuration in the `input` section
- The configuration uses KDL (KDL Document Language) format

## Troubleshooting

### Screen flickering or cursor issues
This is usually related to Nvidia. The configurations already include `WLR_NO_HARDWARE_CURSORS=1`, but you may need to adjust other Nvidia settings in `configs/nvidia-configuration.nix`.

### Apps not launching
Make sure XDG desktop portals are properly configured. Both configurations include the necessary portals.

### Keyboard layout
Both configurations are set to use the Brazilian (`br`) keyboard layout by default. Change this in the respective configuration files if needed.

## References

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Niri Documentation](https://github.com/YaLTeR/niri)
- [NixOS Wiki - Hyprland](https://nixos.wiki/wiki/Hyprland)
