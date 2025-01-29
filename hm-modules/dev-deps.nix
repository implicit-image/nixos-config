{ config, pkgs, ... }:
{
  imports = [
    ./helix.nix
  ];

  home.packages =
    let
      nixos-pkgs = with pkgs; [
        uv
        ripgrep
        # generic gnu stuff
        gcc
        cmake
        gnumake
        libtool
        file
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
        # haskell
        ghc
        stack
        # rust
        rustc
        rust-code-analysis
        rust-analyzer
        rustfmt
        cargo
      ];
    in
      nixos-pkgs;

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.asdf/shims/"
  ];

}
