{
  pkgs,
  lib,
  inputs,
  ...
}: {

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
