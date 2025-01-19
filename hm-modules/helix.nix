{ config, pkgs, lib, ... }:
{

  home.sessionVariables.EDITOR = lib.mkDefault "hx";

  programs.helix = {
    enable = true;
    languages = {
      language = [
        {
          name = "c";
          auto-format = false;
        }
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
          # leader keys
          space = {
            "." = "file_picker_in_current_buffer_directory";
            space = "file_picker";
            q = ":q";
          };
          "A-x" = "command_mode";
        };
        insert = {
          "A-x" = "command_mode";
          "C-space" = "completion";
        };
        select = {
          "A-x" = "command_mode";
        };
      };
      editor = {
        line-number = "relative";
        cursorline = true;
        gutters = {
          layout = [ "diagnostics" "spacer" "diff" "spacer" "line-numbers" "spacer"];
          line-numbers.min-width = 2;
        };
        popup-border = "all";
        statusline = {
          left = [ "mode" "selections" "file-name" "position" ];
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
      };
    };
  };
}
