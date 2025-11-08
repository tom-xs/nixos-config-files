# NixOS Configuration Files

This repository contains NixOS configuration files using Flakes and Home Manager. It includes support for multiple window managers and compositors.

## Features

- **Flake-based Configuration**: Modern NixOS configuration using flakes
- **Home Manager Integration**: User-level package and configuration management
- **Nvidia Support**: Pre-configured for Nvidia graphics cards
- **Multiple Compositor Options**: Choose between GNOME, Hyprland, or Niri

## Structure

```
.
├── configs/
│   ├── configuration.nix           # Main system configuration
│   ├── hardware-configuration.nix  # Hardware-specific configuration
│   ├── nvidia-configuration.nix    # Nvidia GPU configuration
│   ├── hyprland-configuration.nix  # Hyprland system configuration
│   └── niri-configuration.nix      # Niri system configuration
├── home/
│   ├── home.nix                    # Main home-manager configuration
│   ├── hyprland.nix               # Hyprland user configuration
│   └── niri.nix                   # Niri user configuration
├── flake.nix                       # Flake configuration
└── COMPOSITOR_GUIDE.md            # Detailed guide for using compositors
```

## Quick Start

### Initial Setup

1. Clone this repository:
```bash
git clone https://github.com/tom-xs/nixos-config-files.git
cd nixos-config-files
```

2. Edit `flake.nix` to configure which modules you want to use

3. Build and activate:
```bash
sudo nixos-rebuild switch --flake .#camaragibe
```

## Available Desktop Environments

### GNOME (Default)
The repository comes with GNOME configured by default.

### Hyprland
A dynamic tiling Wayland compositor with beautiful animations. See [COMPOSITOR_GUIDE.md](COMPOSITOR_GUIDE.md) for detailed setup instructions.

### Niri
A scrollable-tiling Wayland compositor with a unique workflow. See [COMPOSITOR_GUIDE.md](COMPOSITOR_GUIDE.md) for detailed setup instructions.

## Configuration

### System Configuration
Edit `configs/configuration.nix` for system-wide settings like:
- Hostname
- Time zone
- Locale
- System packages
- Services

### User Configuration
Edit `home/home.nix` for user-specific settings like:
- User packages
- Git configuration
- Shell configuration

### Compositor Configuration
See [COMPOSITOR_GUIDE.md](COMPOSITOR_GUIDE.md) for detailed information about:
- Switching between compositors
- Keybindings for each compositor
- Customization options
- Troubleshooting

## Hardware

This configuration is optimized for:
- Nvidia graphics cards
- Brazilian keyboard layout (can be changed in configuration files)
- Dual-boot with Windows (Limine bootloader configured)

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements.

## License

This configuration is provided as-is for personal use.

## References

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Niri Documentation](https://github.com/YaLTeR/niri)
