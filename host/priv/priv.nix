{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # fchat-horizon
    firestorm
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    fchat-horizon = pkgs.callPackage ./horizon.nix {};
    firestorm = pkgs.callPackage ./firestorm.nix {};
  };
}
