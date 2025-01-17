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
        home-manager
        firefox
      ];

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
