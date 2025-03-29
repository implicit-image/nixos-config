{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30;
    extraPackages = epkgs: [ epkgs.lsp-bridge ];
  };

  home.packages = with pkgs; [
    # formatters
    cljfmt
    # spellcheckers
    hunspell
    hunspellDicts.pl-pl
    hunspellDicts.en_US
    hunspellDicts.el_GR
  ];
}
