{ config, pkgs, ... }:
{
  imports = [
    ./helix.nix
  ];

  home.packages =
    let
      nixos-pkgs = with pkgs; [
        uv
        rustup
        ripgrep
        # generic gnu stuff
        gcc
        cmake
        gnumake
        libtool
        file
        direnv
        devenv
        # language servers
        ccls
        typescript-language-server
        vue-language-server
        jdt-language-server
        lua-language-server
        yaml-language-server
        bash-language-server
        astro-language-server
        kotlin-language-server
        svelte-language-server
        haskell-language-server
        vscode-langservers-extracted
        # emace helpers
        emacs-lsp-booster
        nodejs
        ghc
        stack
      ];
    in
      nixos-pkgs;

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.asdf/shims/"
  ];

}
