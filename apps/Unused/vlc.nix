{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
  ];

	programs.vlc = {
		enable = true;
	};
}