{ pkgs, ... }:

{

	home.packages = with pkgs; [

  ];

	programs.lutris = {
		enable = true;
		steamPackage  = osConfig.programs.steam.package;
		protonPackages = [ pkgs.proton-ge-bin ];
	};

}
