{ config, pkgs, ... }:

{
  # Enable Hyprland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable XDG Desktop Portal for screen sharing and other integrations
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # Environment variables for Hyprland with Nvidia
  environment.sessionVariables = {
    # Nvidia-specific variables for Hyprland
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    
    # Additional Hyprland optimizations
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  # Install essential packages for Hyprland
  environment.systemPackages = with pkgs; [
    # Terminal emulators
    kitty
    
    # App launchers
    wofi
    rofi-wayland
    
    # Notification daemon
    dunst
    
    # Wallpaper
    hyprpaper
    
    # Status bar
    waybar
    
    # Screen locking
    swaylock
    
    # Screenshot utilities
    grim
    slurp
    
    # Clipboard manager
    wl-clipboard
    
    # File manager
    xfce.thunar
  ];

  # Enable polkit for privilege escalation
  security.polkit.enable = true;
}
