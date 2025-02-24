{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
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
        "asdf"
      ];
      theme = "aussiegeek";
    };
    plugins = [];
  };
}
