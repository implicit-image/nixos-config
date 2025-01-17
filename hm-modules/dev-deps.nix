{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    uv
    rustup
    ripgrep
    # generic gnu stuff
    gcc
    cmake
    gnumake
    libtool
    file

    # dev tools
    code-cursor
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };
}
