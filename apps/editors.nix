{ pkgs, lib, config, ... }: 

{
	home.packages = with pkgs; [
    #vscodium-fhs
    pdf4qt
  ];

    programs.vscode = {
      enable = true;
      package = pkgs.vscodium-fhs;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
        vscode-icons-team.vscode-icons
        sumneko.lua
      ];

      
      #/home/jlc/.config/Code/User/settings.json
    };

}
