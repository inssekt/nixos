{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./apps/fish.nix
    ./apps/river.nix
  ];

  

  home-manager.extraSpecialArgs = { inherit inputs; };

  home-manager.backupFileExtension = "bak";

  home-manager.users.bug = { config, pkgs, ...}: {

    imports = [
    ];

    home.username = "bug";
    home.homeDirectory = "/home/bug";
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
        home-manager
        firefox
      ];

    home.file.".config/river".source = config.lib.file.mkOutOfStoreSymlink "/home/bug/nixos/hosts/bugbook/home/dots/river";
    home.file.".config/yambar".source = config.lib.file.mkOutOfStoreSymlink "/home/bug/nixos/hosts/bugbook/home/dots/yambar";
    home.file.".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "/home/bug/nixos/hosts/bugbook/home/dots/kitty";


    xdg = {
      enable = true;
    };

    gtk = {
        enable = true;
        iconTheme = {
          name = "Vimix";
          package = pkgs.vimix-icon-theme;
      };
      theme = {
        name = "Ayu";
        package = pkgs.ayu-theme-gtk;
      };

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
