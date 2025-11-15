{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    # import the noctalia manager module
    ./noctalia.nix
    # inputs.noctalia.homeModules.default

    # import settings broken out into other files
    ./niri/startup.nix
    ./niri/keybinds.nix
    ./niri/layout.nix
    ./niri/windowrules.nix
    ./niri/animations.nix
    ./niri/overview.nix
  ];

  programs.niri = {
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      hotkey-overlay.skip-at-startup = true;
      layer-rules = [
        {
          matches = [{namespace = "^quickshell$";}];
          place-within-backdrop = true;
        }
      ];
    };
  };
}
