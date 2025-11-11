{ pkgs, ... }:

{
  # Place the Niri configuration file in the correct location
  xdg.configFile."niri/config.kdl".source = ./niri-config.kdl; # Path to your config file

  # Ensure key utilities are available for Home Manager sessions
  home.packages = with pkgs; [
    ghostty
  ];

  # Enable Waybar if you wish to use it (launched on startup in the default config)[citation:1]
  # programs.waybar.enable = true;
}
