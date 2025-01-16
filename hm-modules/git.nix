{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "blaz.nie@protonmail.com";
    userName = "Błażej Niewiadomski";
    ignores = [
      "*~"
      "*.swp"
      "#*#"
      ".ccls-cache"
    ];
  };
}
