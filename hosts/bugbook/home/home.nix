{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./apps/river.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs; };

  home-manager.users.bug = {
    home.username = "bug";
    home.homeDirectory = "/home/bug";
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
        firefox
      ];

    programs.bash.shellAliases = {
      nixrb = "sudo nixos-rebuild switch --flake /home/bug/nixos#bugbook";
    };

    programs.home-manager.enable = true;             
  };
}
