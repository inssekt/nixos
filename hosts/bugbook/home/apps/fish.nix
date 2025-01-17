{ pkgs, inputs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      	    set fish_greeting
    '';
    shellAliases = {
      nixrb = "nixos-rebuild switch --flake /home/bug/nixos#bugbook";
    };
  };
}