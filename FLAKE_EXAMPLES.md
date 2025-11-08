# Example Flake Configurations
# This file shows different ways to configure your flake.nix with the available compositor options.
# Copy the relevant section to your flake.nix based on your needs.

## Option 1: Default GNOME Setup (Current)
```nix
{
  description = "My nixos Flake Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = { 
      camaragibe = nixpkgs.lib.nixosSystem {
        modules = [
          ./configs/configuration.nix
          ./configs/nvidia-configuration.nix
          ./home/home.nix
        ];
      };
    };
  };
}
```

## Option 2: Enable Hyprland
```nix
{
  description = "My nixos Flake Configuration with Hyprland";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = { 
      camaragibe = nixpkgs.lib.nixosSystem {
        modules = [
          ./configs/configuration.nix
          ./configs/nvidia-configuration.nix
          ./configs/hyprland-configuration.nix  # Add Hyprland
          
          ./home/home.nix
          ./home/hyprland.nix                   # Add Hyprland home config
        ];
      };
    };
  };
}
```

## Option 3: Enable Niri
```nix
{
  description = "My nixos Flake Configuration with Niri";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = { 
      camaragibe = nixpkgs.lib.nixosSystem {
        modules = [
          ./configs/configuration.nix
          ./configs/nvidia-configuration.nix
          ./configs/niri-configuration.nix      # Add Niri
          
          ./home/home.nix
          ./home/niri.nix                       # Add Niri home config
        ];
      };
    };
  };
}
```

## Option 4: Enable Both Hyprland and Niri (Switchable at Login)
```nix
{
  description = "My nixos Flake Configuration with Multiple Compositors";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = { 
      camaragibe = nixpkgs.lib.nixosSystem {
        modules = [
          ./configs/configuration.nix
          ./configs/nvidia-configuration.nix
          ./configs/hyprland-configuration.nix  # Add Hyprland
          ./configs/niri-configuration.nix      # Add Niri
          
          ./home/home.nix
          ./home/hyprland.nix                   # Add Hyprland home config
          ./home/niri.nix                       # Add Niri home config
        ];
      };
    };
  };
}
```

## Option 5: All Three (GNOME, Hyprland, Niri)
```nix
{
  description = "My nixos Flake Configuration with All Desktop Environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = { 
      camaragibe = nixpkgs.lib.nixosSystem {
        modules = [
          ./configs/configuration.nix           # GNOME is configured here
          ./configs/nvidia-configuration.nix
          ./configs/hyprland-configuration.nix  # Add Hyprland
          ./configs/niri-configuration.nix      # Add Niri
          
          ./home/home.nix
          ./home/hyprland.nix                   # Add Hyprland home config
          ./home/niri.nix                       # Add Niri home config
        ];
      };
    };
  };
}
```

## Notes

- You can switch between desktop environments at the login screen (GDM)
- Only include the compositor modules you want to use
- Each compositor has its own keybindings and workflow - see COMPOSITOR_GUIDE.md
- All configurations include Nvidia compatibility settings
- If you only want one compositor, you may want to disable GDM in configs/configuration.nix
  and configure the compositor to start directly
