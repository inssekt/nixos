{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./apps/river.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs; };

  home-manager.users.bug = {

    imports = [
      ./apps/fish.nix
    ];

    home.username = "bug";
    home.homeDirectory = "/home/bug";
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
        home-manager
        firefox
      ];

    home.file = {
    ".config/yambar/" = { source = ../dots/yambar; target = ".config/yambar/"; };
    };

    programs.bash.shellAliases = {
      nixrb = "sudo nixos-rebuild switch --flake /home/bug/nixos#bugbook";
    };

    programs.git = {
      enable = true;
      userName = "inssekt";
      userEmail = "matthol11@outlook.com";
      extraConfig = {
        user.name = "inssekt";
        user.email = "matthol11@outlook.com";
        init.defaultBranch = "main";
      };
    };


    programs.home-manager.enable = true;             
  };
}
