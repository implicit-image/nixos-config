{ config, pkgs, ... }:
{
  home = {
    sessionVariables = {
      SHELL = "zsh";
      EDITOR = "helix";
    };
  };
}
