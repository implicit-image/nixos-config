{ config, pkgs, lib, ... }:
{

  home.sessionVariables.EDITOR = lib.mkDefault "hx";

  programs.helix = {
    enable = true;
    languages = {
      language = [
        {
          name = "c";
          language-servers = [ "ccls" ];
        }
      ];
      language-server = {
        ccls = {
          command = "ccls";
        };
      };
    };
    settings = {
      theme = "custom-gruber-darker";
      keys = let
        #helper functions
        # hx-bind
        #commands
        ## git commands
        git-status = ":sh git status | column";
        git-branches = ":sh git branch -l";
        ## browsing commands
        browse-parent-dir = [ ":cd .." "file_picker_in_current_directory" ];
        browse-home-dir = [ ":cd ~" "file_picker_in_current_directory" ];
        ## formatting commands
        reindent-and-format = [ "select_all" "indent" "format_selections" ];
      in {
        #MODE: normal
        normal = {
          #MAP: leader keys
          space = {
            "." = "file_picker_in_current_buffer_directory";
            space = "file_picker";
            q = ":q";
            #MAP: insert
            i = {
              "!" = "shell_insert_output";
              d = ":insert-output date";
              r = "insert_register";
            };
            #MAP: git
            g = {
              s = git-status;
              b = git-branches;
            };
            t = {
              w = ":toggle soft-wrap.enable";
              c = ":toggle auto-completion";
            };
          };
          "A-x" = "command_mode";
          K = "hover";
          #MAP: C-x
          "C-x" = {
            k = ":buffer-close";
            K = ":buffer-close!";
          };
          # fast navigation
          "C-k" = "jump_view_up";
          "C-j" = "jump_view_down";
          "C-h" = "jump_view_left";
          "C-l" = "jump_view_right";
          #TODO: figure out how to write macros in nixx config
          # reindent the file
          "=" = reindent-and-format;
        };
        #MODE: insert
        insert = {
          #MAP: leader
          "A-space" = {
            "." = ":open";
            space = "file_picker";
            q = ":q";
            #MAP: insert
            i = {
              "!" = "shell_insert_output";
              r = "insert_register";
            };
          };
          "A-x" = "command_mode";
          "C-space" = "completion";
          #MAP: C-x
          "C-x" = {
            k = ":buffer-close";
            K = ":buffer-close!";
          };
        };
        #MODE: select
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
          display-signature-help-docs = true;
          auto-signature-help = true;
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        file-picker = {
          hidden = true;
          git-ignore = true;
          ignore = true;
          parents = true;
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
    themes = {
      custom-gruber-darker =
        let
          fg0 =      "#e4e4ef";
          fg1 =      "#f4f4ff";
          fg2 =      "#f5f5f5";
          fg3 =      "#a89984";
          bg0 =      "#181818";
          bg1 =      "#282828";
          bg2 =      "#453d41";
          bg4 =      "#52494e";
          bg5 =      "#454545";
          bg6 =      "#232323";
          bg7 =      "#3f3f3f";
          bg8 =      "#2c2c2c";
          red0 =     "#f43841";
          red1 =     "#ff4f58";
          red2 =     "#2B0A0B";
          red3 =     "#fb4934";
          green0 =   "#73c936";
          green1 =   "#b8bb26";
          yellow0 =  "#ffdd33";
          yellow1 =  "#655814";
          blue0 =    "#5292c8";
          orange0 =  "#d65d0e";
          orange1 =  "#fe8019";
          brown0 =   "#cc8c3c";
          quartz =   "#95a99f";
          niagara0 = "#96a6c8";
          niagara1 = "#303540";
          wisteria = "#9e95c7";
          aqua1 =    "#8ec07c";
          grey = "#858583";
        in {
          "attribute" = fg0;
          "keyword" = {
            fg = yellow0;
            modifiers = ["bold"];
          };
          "keyword.directive" = quartz;
          "namespace" = quartz;
          "punctuation" = fg0;
          "punctuation.delimiter" = fg0;
          "operator" = fg0;
          "special" = {
            fg = yellow0;
            modifiers = ["bold"];
          };
          "variable" = fg0;
          "variable.builtin" = {
            fg = yellow0;
            modifiers = ["bold"];
          };
          "variable.parameter" = fg0;
          "type" = quartz;
          "type.builtin" = yellow0;
          "constructor" = {
            fg = quartz;
          };
          "function" = niagara0;
          "function.builtin" = yellow0;
          "tag" = niagara0;
          "comment" = {
            fg = grey;
          };
          "constant.character" = {
            fg = green0;
          };
          "constant.character.escape" = {
            fg = yellow0;
          };
          "constant.builtin" = {
            fg = yellow0;
            modifiers = ["bold"];
          };
          "string" = green0;
          "constant.numeric" = wisteria;
          "label" = fg0;
          "module" = aqua1;
          "diff.plus" = green1;
          "diff.delta" = orange1;
          "diff.minus" = red0;
          "warning" = {
            fg = orange1;
            modifiers = ["bold"];
          };
          "error" = {
            fg = red0;
            modifiers = ["bold"];
          };
          "info" = {
            fg = aqua1;
            modifiers = ["bold"];
          };
          "hint" = {
            fg = blue0;
            modifiers = ["bold"];
          };
          "ui.background" = {
            bg = bg0;
          };
          "ui.linenr" = {
            fg = bg4;
          };
          "ui.linenr.selected" = {
            fg = yellow0;
          };
          "ui.cursorline" = {
            bg = bg1;
          };
          "ui.statusline" = {
            fg = fg0;
            bg = bg1;
          };
          "ui.statusline.normal" = {
            fg = bg1;
            bg = yellow0;
            modifiers = ["bold"];
          };
          "ui.statusline.insert" = {
            fg = bg1;
            bg = blue0;
            modifiers = ["bold"];
          };
          "ui.statusline.select" = {
            fg = bg1;
            bg = wisteria;
            modifiers = ["bold"];
          };
          "ui.statusline.inactive" = {
            fg = fg3;
            bg = bg1;
          };
          "ui.bufferline" = {
            fg = fg3;
            bg = bg6;
          };
          "ui.bufferline.active" = {
            fg = fg0;
            bg = bg7;
          };
          "ui.popup" = {
            bg = bg6;
          };
          "ui.window" = {
            fg = bg1;
          };
          "ui.help" = {
            bg = bg1;
            fg = fg0;
          };
          "ui.text" = {
            fg = fg0;
          };
          "ui.text.focus" = {
            bg = bg5;
            modifiers = ["bold"];
          };
          "ui.selection" = {
            bg = bg2;
          };
          "ui.selection.primary" = {
            bg = bg5;
          };
          "ui.cursor.primary" = {
            bg = fg0;
            fg = niagara1;
          };
          "ui.cursor.match" = {
            bg = yellow1;
          };
          "ui.menu" = {
            fg = fg0;
            bg = bg6;
          };
          "ui.menu.selected" = {
            fg = fg0;
            bg = bg5;
            modifiers = ["bold"];
          };
          "ui.virtual.whitespace" = bg5;
          "ui.virtual.indent-guide" = bg5;
          "ui.virtual.ruler" = {
            bg = bg1;
          };
          "ui.virtual.inlay-hint" = {
            fg = bg4;
          };
          "ui.virtual.wrap" = {
            fg = bg2;
          };
          "ui.virtual.jump-label" = {
            fg = red3;
            modifiers = ["bold"];
          };
          "diagnostic.warning" = {
            underline = {
              color = orange1;
              style = "dashed";
            };
          };
          "diagnostic.error" = {
            underline = {
              color = red3;
              style = "dashed";
            };
          };
          "diagnostic.info" = {
            underline = {
              color = aqua1;
              style = "dashed";
            };
          };
          "diagnostic.hint" = {
            underline = {
              color = blue0;
              style = "dashed";
            };
          };
          "diagnostic.unnecessary" = {
            modifiers = ["dim"];
          };
          "diagnostic.deprecated" = {
            modifiers = ["crossed_out"];
          };
          "markup.heading" = {
            fg = aqua1;
            modifiers = ["bold"];
          };
          "markup.bold" = {
            modifiers = ["bold"];
          };
          "markup.italic" = {
            modifiers = ["italic"];
          };
          "markup.strikethrough" = {
            modifiers = ["crossed_out"];
          };
          "markup.link.url" = {
            fg = green1;
            modifiers = ["underlined"];
          };
          "markup.link.text" = red3;
          "markup.raw" = {
            fg = fg0;
            bg = bg8;
            modifiers = ["bold"];
          };
        };
    };
  };
}
