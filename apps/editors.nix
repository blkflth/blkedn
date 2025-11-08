{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    #vscodium-fhs
    pdf4qt
  ];

    programs.vscode = {
      enable = true;
      package = pkgs.vscodium-fhs;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        ms-python.python
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
        timonwong.shellcheck
        vscode-icons-team.vscode-icons
        sumneko.lua
        yzhang.markdown-all-in-one
        yzane.markdown-pdf
        tomoki1207.pdf
        
      ];
    };
}

