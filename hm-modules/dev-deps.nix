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
    helix = {
      enable = true;
      languages = {
        language = [
          {
            name = "c";
            auto-format = false;
          };
        ];
        language-server = {
          typescript-language-server = {
            command = "echo launching ts lang server";
          };
        };
      };
      settings = {
        theme = "gruber-darker";
        keys = {
          normal = {
            space.space = "file_picker";
            space.q = ":q";
          };
        };
        editor = {
          line-numbers = "relative";
          cursorline = true;
          gutters = {
            layout = [ "diagnostics" "spacer" "diff" "spacer" "line-numbers" "spacer"];
            line-numbers.min-width = 2;
          };
          popup-border = "all";
          statusline = {
            left = [ "mode" "selections" ];
            center = [ "filename" "position"];
            right = [ "diagnostics" "file-encoding" "file-type" "version-control" ];
            separator = " ";
            mode.normal = "<N>";
            mode.insert = "<I>";
            mode.select = "<S>";
          };
          lsp = {
            display-inlay-hints = true;
          };
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
          whitespace = {
            render = {
              space = "all";
              tab = "all";
            };
            characters = {
              space = "·";
              tab = ">";
              tabpad = "·";
            };
          };
          indent-guides = {
            render = true;
          };
          soft-wrap = {
            enable = true;
          };
          smart-tab = {
            enable = true;
          };
          inline-diagnostics = {
            cursor-line = "info";
            other-lines = "error";
            max-diagnostics = 5;
          };
        };
      };
    };
  };
}
