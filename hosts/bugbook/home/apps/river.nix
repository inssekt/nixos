{ config, pkgs, inputs, ... }:
{
  programs.river.enable = true;
  programs.xwayland.enable = true;

  home-manager.users.bug.home.file = {
    ".config/river/" = { source = ../dots/river; target = ".config/river/"; };
  };

  home-manager.users.bug.home.packages = with pkgs; [
        rivercarro
      ];
}