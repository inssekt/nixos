{ config, pkgs, inputs, ... }:
{
  programs.river.enable = true;
  programs.xwayland.enable = true;

  home-manager.users.bug.home.packages = with pkgs; [
        wideriver
      ];
}