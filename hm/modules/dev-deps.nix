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
      cloud-pkgs = with pkgs; [
        azure-cli
      ];
      llm-pkgs = with pkgs; [
        aider-chat
      ];
    in
      nixos-pkgs
      ++ cloud-pkgs
      ++ llm-pkgs;

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
    zed-editor = {
      enable = true;
      extensions = [
        "activitywatch"
        "ada"
        "amber"
        "asciidoc"
        "assembly"
        "astro"
        "autocorrect"
        "awk"
        "basedpyright"
        "bend"
        "brainfuck"
        "c3"
        "caddyfile"
        "cairo"
        "cargo-appraiser"
        "cargo-toml"
        "clojure"
        "cobol"
        "code-stats"
        "csv"
        "d"
        "dart"
        "docker-compose"
        "nix"
        "idris2"
        ""
      ];
      userKeymaps = [
        {
          context = "Workspace";
          bindings = {
            ctrl-shift-t = "workspace::NewTerminal";
          };
        }
      ];
      userSettings = {
        features = {
          copilot = true;
        };
        telemetry = {
          metrics = false;
        };
        vim_mode = true;
        ui_font_size = 16;
        buffer_font_size = 16;
      };
    };
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.asdf/shims/"
  ];

}
