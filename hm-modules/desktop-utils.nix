{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    xclip
    unrar
    unzip
    p7zip
    gnutar
    xarchiver
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-media-tags-plugin
    xfce.thunar-dropbox-plugin
    xfce.thunar-archive-plugin
  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 250;
        height = 100;
        offest = "30x50";
        origin = "top-right";
        transparency = 100;
        frame_color = "#181818";
        font = "Iosevka Nerd Font Mono";
      };
      urgency_normal = {
        background = "#181818";
        foreground = "#f1f1f1";
        timeout = 5;
      };
    };
  };
}
