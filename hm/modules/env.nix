{ config, pkgs, ... }:
{
  home = {
    sessionVariables = {
      SHELL = "zsh";
      HM_FILES = "${config.home.homeDirectory}/repos/nixos-config/hm-files";
    };
  };
}
