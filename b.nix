{ config, pkgs, ... }:
{
  imports = [
    #xdg settings
    ./hm-modules/xdg.nix

    # desktop theme
    ./hm-modules/desktop-theme.nix

    ./hm-modules/desktop-utils.nix

    ./hm-modules/input-devices.nix

    ./hm-modules/git.nix

    # programming dependencies
    ./hm-modules/dev-deps.nix

    # latex config
    ./hm-modules/latex.nix

    # emacs config
    ./hm-modules/emacs.nix

    # books
    ./hm-modules/calibre.nix

    # wine
    ./hm-modules/wine.nix

    # virtualisation
    ./hm-modules/virtualisation.nix
  ];

  home.username = "b";
  home.homeDirectory = "/home/b";



  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
