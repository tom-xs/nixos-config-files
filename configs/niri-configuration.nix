{ config, pkgs, ... }:

{
  # Enable Niri compositor
  programs.niri = {
    enable = true;
  };

  # Enable XDG Desktop Portal for screen sharing and other integrations
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  # Environment variables for Niri with Nvidia
  environment.sessionVariables = {
    # Nvidia-specific variables for Niri
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    
    # Additional Wayland optimizations
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
  };

  # Install essential packages for Niri
  environment.systemPackages = with pkgs; [
    # Terminal emulators
    kitty
    alacritty
    
    # App launchers
    fuzzel
    wofi
    
    # Notification daemon
    mako
    
    # Wallpaper
    swaybg
    
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
