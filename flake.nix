{
  description = "My nixos Flake Configuration";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = { 
      txs-nixos1 = nixpkgs.lib.nixosSystem {
        # specialArgs = { inherit input; };
        modules = [
          ./configs/configuration.nix
          ./configs/nvidia-configuration.nix

          ./home/home.nix
        ];
      };
    };
  };
}
