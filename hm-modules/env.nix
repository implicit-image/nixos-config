{ config, pkgs, ... }:
{
  home = {
    sessionVariables = {
      SHELL = "zsh";
      HM_FILES = "${config.homwDirectory}/repos/nixos-config/hm-files";
    };
  };
}
