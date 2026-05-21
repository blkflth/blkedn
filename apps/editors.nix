{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    #vscodium-fhs
  ];

  programs.neovim = {
    enable = true;
    withPython3 = true;
    withRuby = false;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      statix
      blink-cmp
      blink-cmp-spell
      blink-cmp-git
      monokai-pro-nvim
    ];
  };

  programs.lazyvim = {
    enable = true;

    configFiles = ./lazyvim;
    extras = {
      lang = {
        nix.enable = true;
        git.enable = true;
        json.enable = true;
        markdown.enable = true;
        php.enable = true;
        rust.enable = true;
        toml.enable = true;
        typescript.enable = true;
        yaml.enable = true;
        python.enable = true;
      };
      editor = {
        fzf.enable = true;
        mini-files.enable = true;
        neo-tree.enable = true;
        snacks-explorer.enable = true;
        snacks-picker.enable = true;
      };
      formatting = {
        black.enable = true;
        prettier.enable = true;
      };
      ui = {
        dashboard-nvim.enable = true;
      };
      util = {
        gh.enable = true;
      };
    };

    # IMPORTANT: Extras don't install treesitter parsers automatically
    # You must add them manually for syntax highlighting
    treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      nix
      python
      bash
      fish
      css
      gitcommit
      html
      http
      ini
      json
      json5
      kdl
      lua
      markdown
      markdown_inline
      nginx
      php
      regex
      rust
      ssh_config
      toml
      typescript
      vim
      yaml
    ];

    extraPackages = with pkgs; [
      # LSP servers
      nixd
      pyright

      # Formatters
      alejandra
    ];
  };

  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium-fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      alefragnani.project-manager
      asvetliakov.vscode-neovim
      mkhl.direnv
      ecmel.vscode-html-css
      vadimcn.vscode-lldb
      eamodio.gitlens
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      kamadorueda.alejandra
      ndonfris.fish-lsp
      timonwong.shellcheck
      usernamehw.errorlens
      jgclark.vscode-todo-highlight
      vscode-icons-team.vscode-icons
      esbenp.prettier-vscode
      yzhang.markdown-all-in-one
      yzane.markdown-pdf
      tomoki1207.pdf
      fill-labs.dependi
      ms-python.python
      charliermarsh.ruff
      ms-python.vscode-pylance
      njpwerner.autodocstring
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
    ];
  };
}
