{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    virtualbox
  ];
}
