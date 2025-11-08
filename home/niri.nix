{ config, pkgs, lib, ... }:

{
  # Niri home-manager configuration
  # Note: As of early 2024, Niri's home-manager module may be limited
  # This provides basic configuration and packages
  
  # Home packages for Niri
  home.packages = with pkgs; [
    # Core Niri packages
    niri
    
    # Terminal emulators
    kitty
    alacritty
    
    # App launcher
    fuzzel
    wofi
    
    # Notifications
    mako
    
    # Wallpaper
    swaybg
    
    # Lock screen
    swaylock
    
    # Screenshot
    grim
    slurp
    
    # Clipboard
    wl-clipboard
    
    # Color picker
    wl-color-picker
  ];
  
  # XDG configuration for Niri
  xdg.configFile."niri/config.kdl".text = ''
    // Niri configuration in KDL format
    
    // Input configuration
    input {
        keyboard {
            xkb {
                layout "br"
            }
        }
        
        touchpad {
            tap
            natural-scroll false
        }
        
        mouse {
            accel-speed 0.0
        }
    }
    
    // Output configuration
    output "eDP-1" {
        scale 1.0
    }
    
    // Layout configuration
    layout {
        gaps 10
        
        focus-ring {
            width 2
            active-color 100 200 255 255
            inactive-color 100 100 100 255
        }
        
        border {
            width 2
            active-color 100 200 255 255
            inactive-color 100 100 100 255
        }
    }
    
    // Spawn programs at startup
    spawn-at-startup "mako"
    spawn-at-startup "swaybg" "-i" "/path/to/wallpaper.jpg"
    
    // Key bindings
    binds {
        // Mod key is Super/Windows key
        Mod+Return { spawn "kitty"; }
        Mod+D { spawn "fuzzel"; }
        Mod+Q { close-window; }
        Mod+Shift+E { quit; }
        
        // Focus movement
        Mod+Left { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up { focus-window-up; }
        Mod+Down { focus-window-down; }
        
        Mod+H { focus-column-left; }
        Mod+L { focus-column-right; }
        Mod+K { focus-window-up; }
        Mod+J { focus-window-down; }
        
        // Window movement
        Mod+Shift+Left { move-column-left; }
        Mod+Shift+Right { move-column-right; }
        Mod+Shift+Up { move-window-up; }
        Mod+Shift+Down { move-window-down; }
        
        Mod+Shift+H { move-column-left; }
        Mod+Shift+L { move-column-right; }
        Mod+Shift+K { move-window-up; }
        Mod+Shift+J { move-window-down; }
        
        // Workspace switching
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        
        // Move window to workspace
        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }
        
        // Window management
        Mod+F { fullscreen-window; }
        Mod+Space { maximize-column; }
        
        // Screenshot
        Print { spawn "grim" "-g" "$(slurp)" "-"; }
        
        // Lock screen
        Mod+Shift+L { spawn "swaylock"; }
    }
    
    // Window rules
    window-rule {
        match app-id="org.kde.dolphin"
        default-floating true
    }
    
    // Prefer dark theme
    prefer-no-csd
  '';
  
  # Configure Mako notification daemon
  programs.mako = {
    enable = true;
    backgroundColor = "#1e1e1e";
    textColor = "#ffffff";
    borderColor = "#64a8ff";
    borderSize = 2;
    defaultTimeout = 5000;
  };
  
  # Configure fuzzel launcher
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "kitty";
        layer = "overlay";
      };
      colors = {
        background = "1e1e1edd";
        text = "ffffffff";
        match = "64a8ffff";
        selection = "64a8ff33";
        selection-text = "ffffffff";
        selection-match = "64a8ffff";
      };
    };
  };
}
