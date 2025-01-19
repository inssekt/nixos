{ pkgs, inputs, ... }:

let

    # custom shell applications

    rebuild = pkgs.writeShellApplication {
    name = "rebuild";
    text = "sudo nixos-rebuild switch --flake /home/bug/nixos#bugbook";
  };
in
{

  home-manager.users.bug.home.packages = [
    rebuild
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      	    set fish_greeting
    '';
    shellAliases = {
      rinit = "/home/bug/.config/river/init";
    };
  };
}