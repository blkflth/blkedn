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
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell"; # Use same quickshell version
    };

    matugen = {
      url = "github:/InioX/Matugen";
    }; #tool to grab color-scheme from wallpapers

    vicinae = {
      url = "github:vicinaehq/vicinae";
    };

    #affinity-nix.url = "github:mrshmllow/affinity-nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    niri,
    vicinae,
    #affinity-nix,
    ...
  } @ inputs: let
    # users = "jlc";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    specialArgs = {inherit inputs system;};
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations.blkedn =
      nixpkgs.lib.nixosSystem
      {
        system = system;
        specialArgs = specialArgs;
        modules = [
          ./configuration.nix

          inputs.home-manager.nixosModules.home-manager
          inputs.noctalia.nixosModules.default
          inputs.niri.nixosModules.niri
          {
            nixpkgs.overlays = [niri.overlays.niri];
          }
          {
            #environment.systemPackages = [affinity-nix.packages.x86_64-linux.v3];
          }
        ];
      };

    homeConfigurations = let
      # pkgs = nixpkgs.legacyPackages.${system};
      config = {
        inherit pkgs;
        extraSpecialArgs = specialArgs;
      };
    in {
      homeConfigurations = {
        "jlc" =
          home-manager.lib.homeManagerConfiguration
          {
            pkgs = pkgs;
            modules = [
              ./home.nix
              vicinae.homeManagerModules.default
            ];
          };
      };
    };
  };
}
