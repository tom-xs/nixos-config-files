{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
  imports =
    [
      (import "${home-manager}/nixos")
    ];


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tomasxs = {
    isNormalUser = true;
    description = "Tomas Xavier Santos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  home-manager.users.tomasxs = { pkgs, ... }: {
    home.packages = with pkgs; [ atool httpie ];
    programs.bash.enable = true;
  
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      userName = "Tomás Xavier Santos";
      userEmail = "oipxtomas@gmail.com";
    };

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.05";
  };

}
