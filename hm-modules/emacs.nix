{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30;
  };

  home.packages = with pkgs; [
    # formatters
    cljfmt
  ];
}
