{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [artcraft.homeManagerModules.default];

  programs.artcraft = {
    enable = true;
    apps = [
      "photocraft"
      "vectorcraft"
      "filmcraft"
      "lightcraft"
      "effectcraft"
    ];

  };

}
