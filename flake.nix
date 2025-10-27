{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     niri.url = "github:sodiboo/niri-flake";

     quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
     };

     noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";  # Use same quickshell version
    };

     stylix.url = "github:nix-community/stylix";
     stylix.inputs.nixpkgs.follows = "nixpkgs";

    # vicinae.url = "github:vicinaehq/vicinae";
     # extra-substituters = [ "https://vicinae.cachix.org" ];
     # extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];


  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations.blkedn = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        ./rice/rice.nix
        inputs.home-manager.nixosModules.default
       # vicinae.homeManagerModules.default

      ];
    };
  };
}
