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
    plugins = with pkgs.vimPlugins; [
      statix
      LazyVim
      nvim-treesitter
      blink-cmp
      blink-cmp-spell
      blink-cmp-git
      monokai-pro-nvim
    ];
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      mkhl.direnv
      enkia.tokyo-night
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
      ms-toolsai.jupyter
      njpwerner.autodocstring
      rust-lang.rust-analyzer
      serayuzgur.crates
      tamasfe.even-better-toml
    ];
  };
}
