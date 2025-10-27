{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rmpc
    aonsoku
    jellyfin-web
    vlc
    nyaa
    nomacs
  ];

	programs.rmpc = {
		enable = true;
	};
      programs.aonsoku = {
		enable = true;
	};
      programs.jellyfin-web = {
		enable = true;
	};
      programs.vlc = {
		enable = true;
	};
      programs.nyaa = {
		enable = true;
	};
      programs.nomacs = {
		enable = true;
	};
}
