{ config, pkgs, ... }:
{
  qt = {
    enable = true;
    style = {
      name = "kvantum";
    };
  };
  gtk = {
    enable = true;
    cursorTheme = {
      name = "vimix-cursors";
      package = pkgs.vimix-cursors;
      size = 20;
    };
    font = {
      name = "Iosevka Nerd Font Mono";
      package = pkgs.nerdfonts;
      size = 12;
    };
    iconTheme = {
      name = "vimix-icons";
      package = pkgs.vimix-icon-theme;
    };
    theme = {
      name = "vimix-beryl";
      package = pkgs.vimix-gtk-themes;
    };
  };
}
