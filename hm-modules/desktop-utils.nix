{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    xclip
    xarchiver
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-media-tags-plugin
    xfce.thunar-dropbox-plugin
    xfce.thunar-archive-plugin
  ];
}
