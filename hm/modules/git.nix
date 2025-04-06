{ config, pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      userEmail = "blaz.nie@protonmail.com";
      userName = "Błażej Niewiadomski";
      ignores = [
        "*~"
        "*.swp"
        "#*#"
        ".ccls-cache"
        "node_modules/*"
      ];
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };
  };
}
