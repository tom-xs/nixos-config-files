{ config, pkgs, lib, ... }:

let
  home-manager = (builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
    sha256 = "0q3lv288xlzxczh6lc5lcw0zj9qskvjw3pzsrgvdh8rl8ibyq75s";
    }
);
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

  home-manager.backupFileExtension = "backup";
  home-manager.users.tomasxs = { pkgs, ... }: {
    imports = [
      ./programs/common.nix

      ./programs/niri/default.nix
    ];
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    home.packages = with pkgs; [ neovim atool httpie zed-editor ];
    programs.bash.enable = true;

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
