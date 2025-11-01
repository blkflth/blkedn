{ pkgs, lib, config, ... }: 

{
	home.packages = with pkgs; [
    #vscodium-fhs
    pdf4qt
  ];

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

      
      #/home/jlc/.config/Code/User/settings.json
    };

}
