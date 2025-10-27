{ pkgs, inputs, config, ... }:

  let
    noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
    ] ++ (pkgs.lib.splitString " " cmd);
  in

{

    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # okay let's try this
    programs.niri = {
      settings = {
        # Niri-Flake setting for electron apps
        environment.NIXOS_OZONE_WL = [ "1" ];
          binds = with config.lib.niri.actions; {
              #noctalia bindings first
              "Mod+Space".action.spawn = noctalia "launcher toggle";
              "Mod+S".action.spawn = noctalia "controlCenter toggle";
              "Mod+Comma".action.spawn = noctalia "settings toggle";
              "Mod+V".action.spawn = noctalia "launcher clipboard";
              "Mod+Escape".action.spawn = noctalia "lockScreen lock";
              "Mod+Insert".action.spawn = noctalia "screenRecorder toggle";
              "Mod+Home".action.spawn = noctalia "notifications toggleDND";
              "Mod+Del".action.spawn = noctalia "notifications clear";
              "Mod+End".action.spawn = noctalia "notifications dismissAll";
              "Mod+PageUp".action.spawn = noctalia "bar toggle";
              "Mod+PageDown".action.spawn = noctalia "wallpaper random";
              #And now Niri's
              "Mod+T".spawn = [ "ghostty" "-e" "fish" ]; #should spawn a terminal ?
              "Mod+Shift+T".spawn = [ "ghostty" "-e" "fish" "cd" "/Nix" ]; #should spawn a terminal in the ~/Nix, for easy rebuilds
            # "Mod+W".action = close-window; #disabled so i don't accidentally trigger while setting up.
              "Mod+F".action = toggle-windowed-fullscreen;
              "Mod+Tilde".action = show-hotkey-overlay; #thank you YaLTeR-Sama & Sodiboo Onii-San
            # "Mod+H".action = ;
              "Mod+J".action = focus-workspace-down;
              "Mod+K".action = focus-workspace-up;
            # "Mod+L".action = ;
            };
        };
    };

}
