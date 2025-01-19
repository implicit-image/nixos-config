{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "brackets"
        "regexp"
        "root"
      ];
    };
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "robbyrussel";
    };
    plugins = [];
  };
}
