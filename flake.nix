{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      nixos-hardware = inputs.nixos-hardware;
      lib = inputs.nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        bugbook = lib.nixosSystem {
          modules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-t490

            ./hosts/bugbook/system/configuration.nix
            ./hosts/bugbook/home/home.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
