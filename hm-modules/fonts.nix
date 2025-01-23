{ config, pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
  };

  home.packages = with pkgs; [
    font-manager
  ];
}
