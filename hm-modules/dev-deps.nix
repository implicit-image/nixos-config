{ config, pkgs, ... }:
{
  imports = [
    ./helix.nix
  ];

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

    # formatters
    asdf-vm

    # language servers
    ccls
    vue-language-server
    jdt-language-server
    lua-language-server
    yaml-language-server
    bash-language-server
    astro-language-server
    kotlin-language-server
    svelte-language-server
    haskell-language-server
    # vscode-langserver-extracted
  ];

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}
