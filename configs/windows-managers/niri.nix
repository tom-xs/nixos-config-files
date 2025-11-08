# configs/window-managers/niri.nix
{ config, pkgs, ... }:

{
  programs.niri.enable = true;
  
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
