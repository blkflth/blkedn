{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    # import the noctalia manager module
    ./noctalia.nix

    # import settings broken out into other files
    ./niri/startup.nix
    ./niri/keybinds.nix
    ./niri/layout.nix
    ./niri/windowrules.nix
    ./niri/layerrules.nix
    ./niri/animations.nix
    ./niri/overview.nix
  ];

  programs.niri = {
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      hotkey-overlay.skip-at-startup = true;
      environment = {
        NIXOS_OZONE_WL = "1";
      };
      cursor = {
        hide-after-inactive-ms = 60000;
        hide-when-typing = true;
        theme = "catppuccin-frappe-dark-cursors";
        size = 22;
      };
    };
  };
}
