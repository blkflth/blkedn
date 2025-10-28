{

  description = "JLC Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     niri = {
        url = "github:sodiboo/niri-flake";
        inputs.nixpkgs.follows = "nixpkgs";
      };

     quickshell = {
        url = "github:outfoxxed/quickshell";
        inputs.nixpkgs.follows = "nixpkgs";
      };

     noctalia = {
        url = "github:noctalia-dev/noctalia-shell";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.quickshell.follows = "quickshell";  # Use same quickshell version
      };

     stylix = {
        url = "github:nix-community/stylix";
        inputs.nixpkgs.follows = "nixpkgs";
      };

     alejandra = {
        url = "github:kamadorueda/alejandra/4.0.0";
        inputs.nixpkgs.follows = "nixpkgs";
      };

    # vicinae.url = "github:vicinaehq/vicinae";
     # extra-substituters = [ "https://vicinae.cachix.org" ];
     # extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];


  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    niri,
    stylix,
    alejandra,
    ...
      } @ inputs: {
        formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
        nixosConfigurations.blkedn = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs;};
            modules = [
              ./configuration.nix
            # ./rice/rice.nix
            # ./apps/apps.nix
            # ./hw/hw.nix
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            inputs.noctalia.nixosModules.default
            inputs.niri.nixosModules.niri
          # vicinae.homeManagerModules.default
            ];
    };
  };

}
