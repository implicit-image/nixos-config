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
  ];
}
