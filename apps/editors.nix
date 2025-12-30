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
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      statix
      LazyVim
      nvim-treesitter
      blink-cmp
      blink-cmp-spell
      blink-cmp-git
      monokai-pro-nvim
    ];
    /*
    extraLuaConfig = ''
      vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
      require("lazy").setup({
        performance = {
          reset_packpath = false,
          rtp = {
              reset = false,
            }
          },
        dev = {
          path = "${pkgs.vimUtils.packDir config.home-manager.users.jlc.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
        },
        install = {
          -- Safeguard in case we forget to install a plugin with Nix
          missing = false,
        },
      })
    '';
    */
  };

  programs.vscode = {
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
