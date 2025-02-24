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
    mysql-workbench
    ciscoPacketTracer8
  ];

  # screenshot directory
  systemd.user.tmpfiles.rules = [
    "d ${config.xdg.userDirs.pictures}/screenshots 755 b users -"
  ];

  services = {
    flameshot = {
      enable = true;
      settings = {
        General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          savePath = "${config.xdg.userDirs.pictures}/screenshots";
          uiColor = "#FFDD33";
        };
      };
    };
    dunst = {
      enable = true;
      settings = {
        global = {
          width = 250;
          height = 100;
          offset = "30x50";
          origin = "top-right";
          transparency = 100;
          frame_color = "#181818";
          font = (import ./user-vars.nix).UI_FONT_FAMILY;
        };
        urgency_normal = {
          background = "#181818";
          foreground = "#f1f1f1";
          timeout = 5;
        };
      };
    };
  };
}
