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

<<<<<<< HEAD
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

      
      #/home/jlc/.config/Code/User/settings.json
    };
=======
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      jnoortheen.nix-ide
      rust-lang.rust-analyzer
      vscode-icons-team.vscode-icons
      sumneko.lua
      tomoki1207.pdf
    ];
>>>>>>> 5a3c79d (Formatting)

    #/home/jlc/.config/Code/User/settings.json
  };
}
